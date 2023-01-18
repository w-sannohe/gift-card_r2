@extends('basic')

@section('css')
{{-- この場所に画面毎のcssを記述する --}}

@endsection

@section('javascript-head')
{{-- この場所に画面毎(ヘッダ位置)のjsを記述する --}}

@endsection

@section('content')

<div id="preview-area-inner">
    <div class="preview-frame">
        <div class="frame-h frame-display-h shadow">
            <div class="preview-upload-btn thover uploaded" style="display: block;">
                &nbsp;
            </div>
            <div class="preview-upload-qrcode" style="display:none;">
                &nbsp;
            </div>
            <img src="テンプレート" class="preview-frame-image">
            <div id="preview-message" class="color-black" style="">
            </div>
            <div class="preview-photo">
                <img src="写真" class="preview-upload-image" id="preview-upload-image" width="343" height="458" style="display: inline-block; width: 171.5px; height: 229px;">
            </div>
        </div>
    </div>
</div>
@endsection

@section('javascript-footer')
{{-- この場所に画面毎(フッタ位置)のjsを記述する --}}

@endsection