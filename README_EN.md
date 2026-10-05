# Artwork Studio

Standalone browser image-processing website based on the uploaded Glaze Studio interface.

## Implemented
- PNG/JPEG/WebP import from file picker or drag-and-drop; decoder error handling.
- Six deterministic pixel perturbation patterns, epsilon 4–28, optional edge masking.
- Background worker with progress and cancellation.
- Original/result/split/heatmap views, pointer/touch split control, 25–400% zoom.
- Lossless PNG export at original dimensions, preserving alpha.
- UTF-8 LSB copyright text marker with capacity checks.
- Actual MAE, PSNR and maximum RGB delta measured after watermark embedding.
- Responsive layout and keyboard controls; no CDN dependencies or image uploads.

## Important limitations
This is not the University of Chicago Glaze model or a verified adversarial defense. It does not run CLIP, LPIPS, PGD model optimization, style classification or C2PA signing. The original fabricated defense percentages and SSIM estimates were removed. Pixel perturbations and LSB markers do not guarantee protection against training or scraping. Recompression and editing can destroy the marker. Images are kept in memory only; reload clears them. Files above 50 MB or 24 million pixels are rejected to limit memory use.

## Run locally
Serve `dist` using any static HTTP server, e.g. `python -m http.server 8000 --directory dist`, then open localhost:8000. Do not open through file:// because browser Worker restrictions may block processing.

## Deployment
Deploy the contents of `dist` as static website files on GitHub Pages or Netlify. No server keys or paid model API are required.

## Validation
JavaScript syntax checks passed. Worker validation covered all six styles with masking enabled/disabled, epsilon bounds, alpha preservation, metrics output and watermark capacity. Browser WebMCP registration is feature-detected; a supported browser context was unavailable for validation. Full browser UI QA was unavailable in this execution environment.

## Non-AI admission update
Incoming files are screened before entering the workspace. PNG text/iTXt/zTXt, JPEG metadata segments and WebP XMP/EXIF are inspected for AI source declarations and generator clues. IPTC trainedAlgorithmicMedia/compositeWithTrainedAlgorithmicMedia, Meta AI generation phrases and common generator metadata are blocked. C2PA embedded bytes may yield textual clues but signatures/CBOR manifests are not fully verified or parsed. This is not an AI pixel classifier, OCR, SynthID or Meta invisible-watermark decoder. Metadata can be absent, removed, forged or misleading.

All other files require a local human review with preview, source, evidence, reviewer and explicit non-AI confirmation. AI/unknown declarations cannot be approved. Facebook/Instagram sources require the reviewer to check the original post and AI information label; the app does not query private accounts or social APIs. Cancel/reject leaves the existing artwork intact. Reviews are session-local and performed by the site's user, not an independent authenticated moderation team. This client-side gate is not a server-side enforcement boundary. Production community uploads would require backend admission, durable queues and authorized moderator roles.

Validation covered marker rejection and neutral metadata behavior across PNG, compressed PNG, JPEG and WebP, plus corrupt metadata handling. Browser UI testing remains unavailable.
