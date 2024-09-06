import { Anthropic } from '@anthropic-ai/sdk';
import { NextRequest, NextResponse } from 'next/server';
import { StreamingTextResponse, AnthropicStream } from 'ai';

const anthropic = new Anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY || '',
});

export async function POST(req: NextRequest) {
  const { messages } = await req.json();

  const response = await anthropic.completions.create({
    model: "claude-3-sonnet-20240229",
    prompt: messages.map((m: any) => `${m.role}: ${m.content}`).join('\n'),
    max_tokens_to_sample: 1000,
    stream: true,
  });

  const stream = AnthropicStream(response);
  return new StreamingTextResponse(stream);
}
