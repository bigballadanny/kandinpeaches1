import React, { useState, useEffect } from 'react';
import { useDeepgram } from '../lib/contexts/DeepgramContext';
import { addDocument } from '../lib/firebase/firebaseUtils';
import { motion } from 'framer-motion';

const VoiceRecorder: React.FC = () => {
  const [isRecording, setIsRecording] = useState(false);
  const [transcript, setTranscript] = useState('');
  const deepgram = useDeepgram();

  const startRecording = () => {
    setIsRecording(true);
    // Implement recording logic here
  };

  const stopRecording = () => {
    setIsRecording(false);
    // Implement stop recording logic here
  };

  const saveTranscript = async () => {
    if (transcript) {
      await addDocument('transcripts', { text: transcript, createdAt: new Date() });
      setTranscript('');
    }
  };

  return (
    <div className="voice-recorder">
      <motion.button
        whileHover={{ scale: 1.1 }}
        whileTap={{ scale: 0.9 }}
        onClick={isRecording ? stopRecording : startRecording}
      >
        {isRecording ? 'Stop Recording' : 'Start Recording'}
      </motion.button>
      <p>Transcript: {transcript}</p>
      <button onClick={saveTranscript} disabled={!transcript}>Save Transcript</button>
    </div>
  );
};

export default VoiceRecorder;
