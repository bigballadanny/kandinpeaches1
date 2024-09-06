import { signInWithGoogle } from '../lib/firebase/firebaseUtils';
import Image from 'next/image';

const SignInWithGoogle = () => {
  return (
    <button
      onClick={signInWithGoogle}
      className="flex items-center justify-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50"
    >
      <Image
        src="/google-icon.png"
        alt="Google logo"
        width={20}
        height={20}
        className="mr-2"
      />
      Sign in with Google
    </button>
  );
};

export default SignInWithGoogle;
