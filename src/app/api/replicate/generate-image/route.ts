import { NextResponse } from "next/server";
import Replicate from 'replicate';

export async function POST(request: Request) {
  if (!process.env.REPLICATE_API_TOKEN) {
    return NextResponse.json({ error: "REPLICATE_API_TOKEN is not set" }, { status: 500 });
  }

  const replicate = new Replicate({
    auth: process.env.REPLICATE_API_TOKEN,
  });

  const { prompt } = await request.json();

  try {
    const output = await replicate.run(
      "stability-ai/stable-diffusion:db21e45d3f7023abc2a46ee38a23973f6dce16bb082a930b0c49861f96d1e5bf",
      {
        input: {
          prompt: prompt,
          image_dimensions: "512x512",
          num_outputs: 1,
          num_inference_steps: 50,
          guidance_scale: 7.5,
          scheduler: "DPMSolverMultistep",
        },
      }
    );

    return NextResponse.json({ output });
  } catch (error) {
    console.error("Error from Replicate API:", error);
    return NextResponse.json({ error: (error as Error).message }, { status: 500 });
  }
}
