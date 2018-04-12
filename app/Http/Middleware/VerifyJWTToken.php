<?php
    namespace App\Http\Middleware;
    use Closure;
    use JWTAuth;
    use Tymon\JWTAuth\Exceptions\JWTException;
    use Symfony\Component\HttpKernel\Exception\UnauthorizedHttpException;
    class VerifyJWTToken
    {
        /**
         * Handle an incoming request.
         *
         * @param  \Illuminate\Http\Request  $request
         * @param  \Closure  $next
         * @return mixed
         */
        public function handle($request, Closure $next)
        {
            try{
                //$user = JWTAuth::toUser($request->input('token'));
                 $user = JWTAuth::parseToken()->authenticate();
            }catch (JWTException $e) {
                if($e instanceof \Tymon\JWTAuth\Exceptions\TokenExpiredException) {
                    
                    return response()->json(['token_expired'], $e->getStatusCode());
                }else if ($e instanceof \Tymon\JWTAuth\Exceptions\TokenInvalidException) {
                    return response()->json(['token_invalid'], $e->getStatusCode());
                }else{
                    return response()->json(['message'=>'Token is required','status'=>false]);
                }
            }
           return $next($request);
        }
    }