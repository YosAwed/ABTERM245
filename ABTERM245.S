* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*											*
*   ＡＢＴｅｒｍ　Ver. 0.245+　Ｆｏｒ　Ｘ６８０００（ＡＴコマンド用）			*
*											*
*   ●ＰＥＫＩＮ・ＮＥＴの「ＪＩ２ＡＢＴ」さんのＰＤＳである				*
*     ABT版Terminal Program Ver. 0.24の改造版。						*
*     JI2ABTさんがＣによる大幅なバージョンＵＰを図っているそうなので、			*
*     それまでの繋ぎです。								*
*											*
*   ●ソースリストの変更箇所								*
*	○2630行以降のＢＢＳ局名、電話番号・通信速度及びファンクションキーの		*
*	　Ｆ１１～Ｆ２０の各データを変更してご使用下さい。				*
*	　・トーン信号の方は、自動ダイヤルコマンドのATDPをATDTに変更して下さい。	*
*	　　メニューの「Ｉ」を利用した時、ATDでは正しく実行されません。			*
*											*
*---------------------------------------------------------------------------------------*
* 《編集履歴》										*
*    日　付   ネット名  ＩＤorネーム   ﾊﾞｰｼﾞｮﾝ   サ　ポ　ー　ト　内　容			*
*   -------- ---------- -------------  -------  -------------------------------------	*
*    6/14'87  PEKIN NET JI2ABT		0.21a    Basic programmed & X modem support	*
*    6/27'87	〃			0.22     Function key support			*
*    7/15'87  Sound-net 井関 & 沖田	0.23     Command execute support		*
*    7/20'87  PEKIN NET JI2ABT		0.24     使い勝手の向上!?を実施			*
*   10/11'87  梁山泊68  シュガー	0.241    オートリダイヤル・サポート 		*
*   10/22'87  	〃			0.242    登録済以外への電話等サポート		*
*   11/04'87  	〃			0.243　  TT.XのGPOUTルーチン組み込み		*
*						 　※ TT.X( ESCｼｰｹﾝｽ対応ｶﾗｰﾀｰﾐﾅﾙ)	*
*							5/30'87 post by Macky(梁山泊#33)*
*   12/20'87	〃			0.243+   V0.243のﾘﾒｲｸ+α(些細な機能追加＆改訂)	*	
*   12/02'87  博多んもん CHACK'N        0.244    V0.243の高速化とWAIT追加		*
*    1/01'88  梁山泊68	 シュガー	0.244+	 V0.243+に高速化ルーチン組み込み	*
*    2/21'88  SHARPBBS  あうぇっど      0.245+   V0.244+にwait追加                      *
*						   ※CHACK'Nさんへのお詫。		*
*						     都合により0.244のWAIT,立ち上げ時の *
*						     記録確認は組み込んでいません。	*
*						     0.244のソースリストをお持ちの方で、*
*						     必要な方はお手数ですが組み込みは	*
*						     ご自分でお願いします。		*
*						     また、ＳＹＭ２ルーチンも変更して	*
*						     います。申し訳ありません。		*
*											*
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*---------------------------------------------------------------------------------------------
* 《使い方の簡単な説明》
*   ●画面サイズの切り換え………………（Ｆ１キー：画面）
*	○画面サイズを８０桁×２５行から９６桁×２５行表示、またはその逆に切り換えます。
*	  変更は随時（通信中を含む）可能です。初期画面は８０桁です。
*
*   ●ダウンロード…………………………（Ｆ２キー：記録）
*	○Ｆ２キーを押すとモード欄に入力要求メッセージが表示されますので、キーボードより
*	  記録するファイル名を入力して下さい。
*	  間違えて押した場合は、リターンキーのみを押せば「ターミナル」モードに戻ります。
*	  記録中はメッセージ欄に「ダウンロード中」と表示されます。
*	  終了する場合は再度Ｆ２キーを押して下さい。
*	  なお、ディスクの容量がなくなった場合は、ファイルをクローズしますが、継続するか
*	  確認はしません（手抜きです）。
*
*   ●自動ダイヤル、簡易通信レート設定（Ｆ３キー：接続）
*	○簡易ポップアップメニューが表示されます。
*	  通信レート設定の場合は「１～９」を、自動ダイヤルする場合は「Ａ～Ｉ」をキーボード
*	  より入力して下さい。
*	  Ｖｅｒ．０.２４４、０.２４３と異なり、事前に「ＡＴＸ４」等を実行する必要はありま
*	  せん。
*	  話中等の理由でリダイヤルを中止する場合は、ＥＳＣキーを押して下さい。
*	  接続したがキャリアが設定時間内に得られない場合、自動的に回線を切断しますが、
*	  リターンキー等を入力すれば、すぐに切断されます。
*	  また、設定時間内に接続処理が終了しない場合、自動的に回線を切断します。
*	  （キャリアが聞こえていても切断してしまいます）
*
*   ●アップロード…………………………（Ｆ４キー：転送）
*	○アップロードするファイル名をキーボードより入力して下さい。
*
*   ●プログラムを終了……………………（Ｆ５キー：終了）
*	○ＯＳに戻ります。ダウンロード中の場合は、ファイルをクローズしてから終了します。
*	  単に回線を切断するだけの場合は、Ｆ３キーにより、「回線接断」を選択して下さい。
*
*   ●比較アップロード……………………（Ｆ６キー：比転送）
*	○ホストのエコーバックを利用して、転送した文字とホスト側が受信した文字を比較して
*	  誤りがあれば、再度転送します。比較する分だけ時間がかかりますが（気にならない程度）
*	  文字化け等の防止になります（オリジナル作者はこのモードを推奨しています）。
*
*   ●Ｘモデムプロトコル　ダウンロード（Ｆ７キー：Ｘ記録）
*	○チェック・サムに対応（ＣＲＣには対応されていません）。
*	  各ネットの指示に従い、ホスト側の準備ができたら、Ｆ７キーを押して下さい。
*	  次に記録するファイル名を入力して、リターンキーを押して下さい。処理を開始します。
*	  受信状態が悪く、処理を中止する場合は「ＥＳＣキー」を押して下さい。
*	  次に、ホスト側の中断手続きを必ず実行して下さい。
*
*   ●Ｘモデムプロトコル　アップロード（Ｆ８キー：Ｘ転送）
*	○転送するファイル名を入力して下さい。
*	  中止した場合は、終了コードを送りますので、転送分はホスト側に記録されます。
*	  ホスト側のファイル削除処理を実行して下さい。
*
*   ●ブレーク信号送出……………………（Ｆ９キー：Ｂ信号）
*	○ログイン時にブレーク信号を送る必要のあるネットの場合のみ使用します。
*
*   ●ＯＳのコマンド、プログラムの実行（Ｆ10キー：ＯＳ）
*	○コマンド（Dir,Type等）や実行可能プログラムを起動する場合に使用します。
*	  ＡＢＴｅｒｍ Ver. 0.244+の機能不足の面はこのモードで補って下さい。
*	  例えば、ディレクトリの変更（ドライブの変更も含む）は、
*		Human68k> b:              カレントドライブをＢドライブに変更
*		Human68k> ryozanpaky\PDS  ＢドライブのＰＤＳというディレクトリに変更
*	  スクリーンを初期化するコマンドやプログラムを実行した場合、ターミナルモードに
*	  戻った時、通信用画面が消去されています。ご注意下さい。
*	  画面が消去されるだけですので、通信中の場合はそのまま継続できます。これはバグでは
*	  なく、単なる手抜きです（画面保存用としてメモリを浪費したくなかった）。
*
*
*   ●その他
*	○入力を要求するモードは、「リターンキー」のみを押せばターミナルモードに戻ります。
*	  間違えて押した場合は即「リターンキー」を…。
*
*	○通信中、ＥＳＣシーケンスコードにより、カーソルが消えたり、色が付いたままになった
*	  場合は入力要求をだすファンクションキーを押し、リターンキーのみを押してみて下さい。
*	  解除されます。
*
*	○不当なフロー制御コードが送られてきて、システムがハングした場合は、
*	  本体上面、奥にある「INTERRUPT」スイッチを押して下さい。
*	  復帰できると思います。
*	  但し、無闇に押さないで下さい（最終手段です）。
*	  これで解除出来ない場合は、「RESET」スイッチを押すしか方法はありません。
*	  なお、ここでとった方法はあまりよい方法とは云えませんので、「INTERRUPUT」スイッチに
*	  よる割り込みを使われたくない方で、アセンブリ言語がわかる方は削除して下さい。
*	  くれぐれも無闇に押さないように。
*
*	○８０桁目に改行コードを入れてくれるネットでは、画面上、空行が１行挿入される場合が
*	  あります。その場合、ダウンロードしたファイルでは、空行は記録されていません。
*
*	○その他、細かい点で変更していますが、使う上で支障はないと思います。
*	  	  
*	○時刻表示の右隣は、通信時間表示と通信料金（電話代）表示用として空けてあります。
*	  ファイル名表示機能、ＥＳＣシーケンスのブリンク対応等と併せてどなたか拡張されませんか
*	  特に、ドライブを操作するものはバグが恐くてサポートできませんので。
*	  できればハードディスクに対応できればと…。
*
*--------------------------------------------------------------------------------------------

*-----------------------*
*	ＣＯＮＳＴ	*
*-----------------------*
*
_exit:	   equ	$FF00	; 処理終了
_inpout:   equ	$FF06	; １文字入出力(ブレイクなし)
_gets:	   equ	$FF0A	; 文字列入力
_print:	   equ	$FF09	; 文字列表示
_super:	   equ	$FF20	; スーパバイザモード切り替え
_fnckey:   equ	$FF21
_conctrl:  equ	$FF23
_creat:	   equ	$FF3C	; ファイル作成
_breakck:  equ	$ff33	;
_open:	   equ	$FF3D	; ファイル・オープン
_close:	   equ	$FF3E	; ファイル・クローズ
_read:	   equ	$FF3F	; 指定バイト分読み込み
_write:	   equ	$FF40	; 指定バイト分書き込み
_setblock: equ	$FF4A	; メモリブロック変更
_exec:	   equ	$FF4B	; コマンド実行
*	
LF:	   equ	$0A	; line feed
CR:	   equ	$0D	; Carige return
EOF:	   equ	$1A	; End of file mark
ESC:	   equ	$1B	; Escape sequence
SOH:	   equ	$01	; Send of header
ACK:	   equ	$06	; Good
NAK:	   equ	$15	; Illigal
EOT:	   equ	$04	; End of text
BL:	   equ	$07	; bell
*
*	        stppbbxs     bau          Flow
b300non:   equ %0100110000000010 ;  300bps N
b300xon:   equ %0100111000000010 ;  300bps Y
b120non:   equ %0100110000000100 ; 1200bps N
b120xon:   equ %0100111000000100 ; 1200bps Y
b240xon:   equ %0100111000000101 ; 2400bps Y
b480xon:   equ %0100111000000110 ; 4800bps Y
b960xon:   equ %0100111000000111 ; 9600bps Y
b120tnc:   equ %0111101000000100 ; TNC 初期状態
*
OVERTIME:  equ	80000	; 通信回線からのタイムカウンタ・オーバーランチェック用
LCOUNT:	   equ	$60000	; モデムへのコマンド再実行用タイミングカウント
CALLCNT:   equ	$12000	; 呼出音確認時間調整用カウント（SIZE:ロングワード）
CNTRT_LOOP:equ	$b000	; コントラストのフェードＩＮ、ＯＵＴ用ループ・カウント
*
NMI_RESET: equ	$e8e007
SCC_A:	   equ	$e98005
LPACKET:   equ	128
TX_TY:	   equ	0
COL_LINE:  equ	$005f0018
GX1:	   equ	0
GY1:	   equ	0
GX2:	   equ	767
GY2:	   equ	1023
*
p1_pat:	   equ	%1100_1100_0011_0011
p2_pat:	   equ	%1010_1010_1010_1010
clr_pat:   equ	%0000_0000_0000_0000
full_pat:  equ	%1111_1111_1111_1111
*
text2_color equ %10011_00011_10011_0
*
F1_x:	   equ	0
F2_x:	   equ	72
F3_x:	   equ	144
F4_x:	   equ	216
F5_x:	   equ	288

F6_x:	   equ	372
F7_x:	   equ	444
F8_x:	   equ	516
F9_x:	   equ	588
F10_x:	   equ	660

*-----------------------*
*	マクロ		*
*-----------------------*
print:	macro	text		; テキスト表示
	pea	text
	dc.w	_print
	addq.l	#4,sp
	endm	print

fcreat:	macro	fn,mode		; ファイル作成
	move.w	mode,-(sp)
	pea	fn
	dc.w	_creat
	addq.l	#6,sp
	endm	fcreat

fopen:	macro	fn,mode		; ファイルのオープン
	move.w	mode,-(sp)
	pea	fn
	dc.w	_open
	addq.l	#6,sp
	endm	fopen

fread:	macro	fp,nbytes,addr	; ファイルから読み込み
	move.l	nbytes,-(sp)
	pea	addr
	move.w	fp,-(sp)
	dc.w	_read
	lea	10(sp),sp
	endm	fread

fwrite:	macro	fp,nbytes,addr	; ファイルへの書き込み
	move.l	nbytes,-(sp)
	pea	addr
	move.w	fp,-(sp)
	dc.w	_write
	lea	10(sp),sp
	endm	fwrite

fclose:	macro	fp		; ファイルのクローズ
	move.w	fp,-(sp)
	dc.w	_close
	addq.l	#2,sp
	endm	fclose

funcset:macro	$1,$2		; ファンクションキー設定
	pea	$2
	move.w	$1,-(sp)
	dc.w	_fnckey
	addq.l	#6,sp
	endm	funset

gprint:	macro	addr
	movem.l	d0/a1,-(sp)
	lea	addr,a1
	bsr	pr
	movem.l	(sp)+,d0/a1
	endm	gprint	

tgets:	macro	addr		; テキスト画面用文字列入力
	pea	addr
	dc.w	_gets
	addq.l	#4,sp
	endm	gets

b_clr_st:macro	mode
	move.b	mode,d1
	moveq.l	#$2a,d0
	trap	#15
	endm	b_clr_st

b_locate:macro	x,y
	move.w	x,d1
	move.w	y,d2
	moveq.l	#$23,d0
	trap	#15
	endm	b_locate

tgusend:macro	screen,mode
	moveq.l	screen,d1
	moveq.l	mode,d2
	moveq.l	#$0e,d0
	trap	#15
	endm	tgusend

crtmod:	macro	mode	
	moveq.l	mode,d1
	moveq.l	#$10,d0
	trap	#15
	endm	crtmod

b_consol:macro	x_y,col_line
	move.l	x_y,d1
	move.l	col_line,d2
	moveq.l	#$2e,d0
	trap	#15
	endm	b_consol

g_clr_on:macro
	moveq.l	#$90,d0
	trap	#15
	endm	g_clr_on

window:	macro	x1,y1,x2,y2
	move.w	x1,d1
	move.w	y1,d2
	move.w	x2,d3
	move.w	y2,d4
	moveq.l	#$b4,d0
	trap	#15
	endm	window

wipe:	macro
	moveq.l	#$b5,d0
	trap	#15
	endm	wipe

apage:	macro	page
	moveq.l	page,d1
	moveq.l	#$b1,d0
	trap	#15
	endm	apage

vpage:	macro	page
	moveq.l	page,d1
	moveq.l	#$b2,d0
	trap	#15
	endm	vpage

b_putmes:macro	atr,x,y,str_cnt,addr
	moveq.l	atr,d1
	moveq.l	x,d2
	moveq.l	y,d3
	moveq.l	str_cnt,d4
	lea	addr,a1
	moveq.l	#$2f,d0
	trap	#15
	endm	b_putmes

b_paint:macro	addr
	lea	addr,a1
	moveq.l	#$d7,d0
	trap	#15
	endm	b_paint

func_pt:macro	x,pat
	movem.l	d0-d7/a0-a6,-(sp)
	lea	funcp3_buf,a1
	move.w	x,2(a1)
	move.w	pat,10(a1)
	moveq.l	#$d7,d0
	trap	#15
	movem.l	(sp)+,d0-d7/a0-a6
	endm	func_pt

b_boxrev:macro	addr
	lea	addr,a1
	moveq.l	#$d8,d0
	trap	#15
	endm	b_boxrev

b_xline:macro	x1,y1,x2,addr
	lea	addr,a1
	move.w	x1,2(a1)
	move.w	y1,4(a1)
	move.w	x2+1,6(a1)
	sub.w	x1,6(a1)
	moveq.l	#$d3,d0
	trap	#15
	endm	b_xline

b_yline:macro	x1,y1,y2,addr
	lea	addr,a1
	move.w	x1,2(a1)
	move.w	y1,4(a1)
	move.w	y2+1,6(a1)
	sub.w	y1,6(a1)
	moveq.l	#$d4,d0
	trap	#15
	endm	b_yline

tpalet2:macro
	moveq.l	#2,d1
	move.l	#text2_color,d2
	moveq.l	#$13,d0
	trap	#15
	endm	tpalet2

fnc_line:macro	mode
	move.w	mode,-(sp)
	move.w	#14,-(sp)
	dc.w	_conctrl
	addq.l	#4,sp
	endm	fnc_line

fntget:	macro	code,pat_addr
	movem.l	d1-d7/a0-a6,-(sp)
	moveq.l	#8,d1
	swap	d1
	move.w	code,d1
	lea	pat_addr,a1
	moveq.l	#$19,d0
	trap	#15
	movem.l	(sp)+,d1-d7/a0-a6
	endm	fntadr

textput:macro	pat_addr
	movem.l	d1-d3,-(sp)
	lea	pat_addr,a1
	moveq.l	#$1b,d0
	trap	#15
	movem.l	(sp)+,d1-d3
	endm	textput

popup_menu:macro x,y,haba,takasa,str_addr
	movem.l	d0-d4/a1,-(sp)
	move.w	x,d1
	move.w	y,d2
	move.w	haba,d3
	move.w	takasa,d4
	lea	str_addr,a1
	bsr	disp_menu
	movem.l	(sp)+,d0-d4/a1
	endm	popup_menu

breakset:macro flg
	move.w	flg,-(sp)
	dc.w	_breakck
	addq.l	#2,sp
	endm	break_set

*=======================================*
*	メモリ開放（プログラム開始）	*
*=======================================*
	.text
	.even
start:	equ	*
	bsr	memfree
*
*	有り難くないことに何故かＤＯＳは最初に空きメモリーをプロセスに
*	くれるので、使っていないメモリをＤＯＳに返します。
*

*---------------------------------------*
*	ＧＶＲＡＭの使用状態チェック	*
*---------------------------------------*

vram_ck:equ	*
	tgusend	#0,#-1
	cmp.l	#1,d0
	bne	init
	print	gram_msg
	bsr	keyinw
	bsr	putch
	cmp.b	#'Y',d0
	beq	init
	cmp.b	#'y',d0
	beq	init
	print	end_msg
	dc.w	_exit

*---------------------------------------*
*	画面初期化			*
*---------------------------------------*
init:	equ	 *			  ; 画面等初期化
	bsr	 b_curoff
	breakset #-1
	tst.w	 d0
	beq	 _i1
	move.w	 d0,brk_flag
	breakset #0
_i1:
	bsr	 time_off	
	bsr	 super_on
	move.l	 $00007c,Old_NMI
	move.l	 #NMI,$00007c
	bsr	 super_off
	bsr	 cntrst_set
	funcset  #0,funcbuf		  ; 現在のﾌｧﾝｸｼｮﾝｷｰのｱｻｲﾝを記録
	funcset  #256,setfunc		  ; ファンクション・キー設定
	fnc_line #3

	bsr	 init1
	bsr	 init2
	lea	 func1,a0
	bsr	 init2_1
	bsr	 init3
	bsr	 init4

	bsr	 time_on
	bsr	 commode		  ; 通信モード設定
	gprint	 wupmsg			  ; オープニングメッセージ表示

*---------------------------------------*
*	メインルーチン			*
*---------------------------------------*
main:	equ	*	   ; メイン・ルーチン
	bsr	lofcom		; 回線の入力バッファに文字が残っているか？
	tst	d0
	beq	_chkkey		; 残って無ければ、キー入力の検査
	bsr	getcom		; 回線より１文字入力
	bsr	gout		; putch
	bra	main
_chkkey:bsr	getch		; キー入力の検査
	tst	d0
	beq	main		; キー入力が無ければ主処理へ
	bsr	putcom		; １文字回線へ出力
	bra	_chkkey

*---------------------------------------*
*	各機能の処理			*
*---------------------------------------*
command:move.b	FNCsns1,d0
	btst	#3,d0		; F1
	bne	screen
	btst	#4,d0		; F2
	bne	down
	btst	#5,d0		; F3
	bne	phone
	btst	#6,d0		; F4
	bne	up
	btst	#7,d0		; F5
	bne	exit
	move.b	FNCsns2,d0
	btst	#0,d0		; F6
	bne	cup
	btst	#1,d0		; F7
	bne	xdown
	btst	#2,d0		; F8
	bne	xup
	btst	#3,d0		; F9
	bne	sbreak
	btst	#4,d0		; F10
	beq	qcmdErr
	
	bsr	doscom
	bra	qcmd

*---------------------------------------*
*	ターミナル・モードに復帰	*
*---------------------------------------*
qcmdErr:bsr	 beep_on
qcmd:	bsr	 consol25
	b_putmes #1,#12,#30,#82,termret
	gprint	 cur_on
	gprint	 esc_0m
	rts

*---------------------------------------*
*	ターミナル終了			*
*---------------------------------------*
exit:	equ	 *
	func_pt	 #F5_x,#clr_pat
	tst.w	 dflag		; ダウンロード（記録）中かどうか？
	bmi	 _e1
	move.b	 #EOF,w_data
	bsr	 fputch
	fclose	 dflag		; ダウンロードファイルのクローズ
	tst.w	 d0
	bmi	 _e1
	bsr	 b_curoff
	bsr	 beep_on
	b_putmes #1,#12,#31,#82,clsmsg
	b_putmes #1,#19,#31,#63,dfid
	bsr	 timing2
_e1:
	bsr	 beep_on
	b_putmes #6,#12,#31,#82,ending
	bsr	 b_curoff
	bsr	 timing2
	print	 crlf
	bsr	 time_off
	crtmod	 #$10
	wipe
	bsr	 consol31
	fnc_line #0
	funcset  #256,funcbuf		; ファンクション・キー回復
	addq.l	 #8,sp			; スタック回復(bsr getch,bsr command分)
	bsr	 super_on
	move.l	 Old_NMI,$00007c
	bsr	 super_off
	move.b	 cntrst,d1
	bsr	 contrast
	tst.w	 brk_flag
	beq	 _e2
	breakset #1
_e2:
	bsr	 b_curon
	dc.w	 _exit			; 処理終了

*---------------------------------------*
*	ダウン・ロード			*
*---------------------------------------*
down:	equ	 *
	func_pt	 #F2_x,#clr_pat
	tst.w	 dflag			; ダウンロード実行中か？
	bmi	 _d1
	move.b	 #EOF,w_data
	bsr	 fputch
	fclose	 dflag			; ダウンロードファイルのクローズ
	move.w	 #-1,dflag
	bsr	 b_curoff
	bsr	 beep_on
	b_putmes #1,#24,#31,#6,clsmsg
	b_putmes #1,#31,#31,#53,dfid
	bsr	 timing2
	bsr	 msg_clr
	bra	 _qdown
_d1:
	b_putmes #1,#12,#30,#82,dwnmsg
	bsr	 beep_on
	bsr	 consol31
	b_locate #28,#30
	tgets	 dfname			; ファイル名の入力
	bsr	 consol25
	fopen	 dfid,#0		; ファイルの存在チェック
	tst	 d0
	bmi	 _dwnok
	fclose	 d0			; 既に存在するファイルを指定した。
	bsr	 beep_on
	b_putmes #6,#12,#31,#82,dwnovr
	bsr	 timing2
	bsr	 msg_clr
	bra	 _qdown
_dwnok:	bsr	 b_curoff
	fcreat	 dfid,#$20		; ファイルの作成
	move.w	 d0,dflag
	bmi	 _dwn_er		; －１の場合は失敗
	bsr	 beep_on
	b_putmes #1,#12,#31,#82,logmsg	; 作成成功のメッセージ
	b_locate cur_x,cur_x+2
	bra	 _qdown
_dwn_er:bsr	 beep_on
	b_putmes #6,#12,#31,#82,dwnerr
	bsr	 timing2
*	b_putmes #0,#12,#31,#82,del_line
	bsr	 msg_clr
_qdown:
	func_pt	 #F2_x,#p1_pat
	jmp	 qcmd

*---------------------------------------*
*	アップロード			*
*---------------------------------------*
up:	equ	 *
	func_pt	 #F4_x,#clr_pat
	bsr	 beep_on
	b_putmes #1,#12,#30,#82,uplmsg
	bsr	 consol31
	b_locate #28,#30
	tgets	 ufname			; 転送ファイル名の入力
	bsr	 b_curoff
	bsr	 consol25
	b_locate cur_x,cur_x+2
	fopen	 ufid,#0		; ファイルのオープン
	move.w	 d0,uflag
	bmi	 _upl_er		; －１ ならばオープン失敗
	bsr	 beep_on
	b_putmes #1,#12,#31,#82,upl_msg
	bsr	 b_curon
	bsr	 chkuget		; 回線バッファの内容を表示
_u1:
	bsr	 brkchk			; 作業中止？
	tst.w	 brktst
	bne	 _uend

	bsr	 fgetch			; １文字ファイルから読み込む
	tst.l	 d0			; 読み込み完了なら終了
	beq	 _uend			;   何も読み込んでない。
	bmi	 _upl_er		;   読み込みエラー
	move.b	 data,d0
	cmp.b	 #EOF,d0		; ファイル終了マーク
	beq	 _uend
	cmp.b	 #LF,d0			; ＬＦは送らない
	beq	 _u1
	bsr	 putcom			; 1文字転送
	bsr	 chkuget		; 転送中に受信した文字を表示
	bra	 _u1

_uend:	fclose	 uflag			; 転送ファイルのクローズ
	bsr	 beep_on
	b_putmes #1,#24,#31,#6,clsmsg
	b_putmes #1,#31,#31,#53,ufid
	bra	 _qup
_upl_er:bsr	 beep_on
	b_putmes #6,#12,#31,#82,uplerr
_qup:
	bsr	 timing2
	bsr	 msg_clr
	tst.w	 dflag
	bmi	 _qup1
	b_putmes #1,#12,#31,#82,logmsg
_qup1:
	func_pt	 #F4_x,#p1_pat
	jmp	 qcmd

*---------------------------------------*
*	内容比較しながらアップロード	*
*---------------------------------------*
cup:	equ	 *
	func_pt	 #F6_x,#clr_pat
	bsr	 beep_on
	move.l	 a2,-(sp)
	move.l	 d3,-(sp)
	b_putmes #1,#12,#30,#82,cuplmsg
	bsr	 consol31
	b_locate #32,#30
	tgets	 ufname			 ; 転送ファイルの指定
	bsr	 consol25
	b_locate cur_x,cur_x+2

	fopen	 ufid,#0		 ; ファイルのオープン
	move.w	 d0,uflag
	bmi	 _cupl_er		 ; －１ ならばオープン失敗
	b_putmes #1,#12,#31,#82,cupl_msg
	bsr	 chkuget		 ; 回線バッファの内容を表示
_cnxln:	clr.w	 count
	clr.w	 ncheck
	lea	 check,a2
	bsr	 fgline			 ; １行バッファへ入力
	tst	 d0
	beq	 _cend
_cnxch:
	bsr	 brkchk			 ; 作業中止？
	tst.w	 brktst
	bne	 _cend
	bsr	 bgetch
	cmp.b	 #EOF,d0		 ; ファイル終了マーク？
	beq	 _cchk
	cmp.b	 #CR,d0			 ; 行終了？
	beq	 _cchk
	bsr	 putcom			 ; 1文字転送

	move.l	 #10000,d6 		 ; 1万回ＬＯＯＰＷＡＩＴしてみたの
wait_1:	nop
	dbra	 d6,wait_1

	addq.w	 #1,count
	bsr	 lofcom			 ; 転送中にエコーバックされたか？
	tst	 d0
	beq	 _cnxch
	bsr	 getcom			 ; １文字受信
	tst.b	 d0
	beq	 _cnxch
	move.b	 d0,(a2)+		 ; チェック用バッファへ格納
	bsr	 gout			 ; putch
	addq.w	 #1,ncheck
	bra	 _cnxch
_cchk:
	clr.w	 count
	clr.w	 d3
	clr.b	 (a2)
	lea	 check,a2

_c1:	bsr	 bgetch
	move.b	 d0,chkch		 ; チェック用バッファへ格納
	cmp.b	 #EOF,d0
	beq	 _cend
	cmp.b	 #CR,d0
	beq	 _clend	
	
_c2:	cmp.w	 ncheck,d3
	bge	 _c3
	move.b	 (a2,d3),d0
	addq.w	 #1,d3
	clr.w	 nakflag
	bra	 _c4
_c3:	bsr	 getcomw		 ; 回線より１文字入力
	tst.w	 nakflag		 ; オーバーラン？
	bne	 _c6
	bsr	 gout			 ; putch
_c4:
	cmp.b	 chkch,d0
	beq	 _c5
	clr.w	 count			 ; 文字誤り・先頭文字からチェックし直し
	move.b	 d0,chkch
	bsr	 bgetch
	cmp.b	 chkch,d0
	bne	 _c2
_c5:	addq.w	 #1,count		 ; 次の文字を示す
	bra	 _c1

_c6:	bsr	 beep_on		 ; gprint beep
	gprint	 crlf
	move.b	 erach,d0		 ; １行取り消し
	bsr	 putcom	
	clr.w	 count
	clr.w	 ncheck
	lea	 check,a2
	bra	 _cnxch

_clend:	bsr	 putcom
_c8:	bsr	 getcomw
	tst.w	 nakflag
	bne	 _c9
	bsr	 gout			 ; putch
	bra	 _c7
_c9:	moveq.l	 #CR,d0
	bra	 _clend
_c7:	cmp.b	 #CR,d0
	beq	 _cnxln
	bra	 _c8

_cend:	fclose	 uflag			 ; 転送ファイルのクローズ
	bsr	 beep_on
	b_putmes #1,#28,#31,#6,clsmsg
	b_putmes #1,#35,#31,#49,ufid
	bra	 _qcup
_cupl_er:
	bsr	 beep_on
	b_putmes #6,#12,#31,#82,uplerr
	bsr	 timing2
	bra	 _qcup0
_qcup:
	bsr	 timing
_qcup0: bsr	 msg_clr
	tst.w	 dflag
	bmi	 _qcup1
	b_putmes #1,#12,#31,#82,logmsg
_qcup1:
	move.l	 (sp)+,d3
	move.l	 (sp)+,a2
	func_pt	 #F6_x,#p1_pat
	jmp	 qcmd

*------------------------------------------------------------------*
*	Ｘモデムプロトコル・ダウンロード（チェックサム）	   *
*------------------------------------------------------------------*
xdown:	equ	 *
	func_pt	 #F7_x,#clr_pat
	bsr	 beep_on
	move.w	 dflag,-(sp)
	move.w	 #-1,dflag	

	b_putmes #1,#12,#30,#82,xdwnmsg
	bsr	 consol31
	b_locate #36,#30
	tgets	 xfname			 ; ファイル名の入力
	bsr	 b_curoff
	bsr	 consol25
	b_locate cur_x,cur_x+2
	fopen	 xfid,#0		 ; ファイルの存在チェック
	tst	 d0
	bmi	 _xdwnok
	fclose	 d0			 ; 既に存在するファイルを指定した。
	bsr	 beep_on
	b_putmes #6,#12,#31,#82,dwnovr
	bra	 _qxd1

_xdwnok:
	fcreat	 xfid,#$20		 ; ファイルの作成
	move.w	 d0,xflag
	bmi	 _xd_er			 ; －１の場合は失敗
	bsr	 xbpsset		 ; Flow制御を除く
	b_putmes #1,#12,#31,#82,xcremsg
	bsr	 beep_on
	bsr	 b_curon
	moveq.l	 #NAK,d0
	bsr	 putcom			 ; 送信要求
	moveq.l	 #1,d2	
_xdnext:
	bsr	 brkchk			 ; 作業中止？
	tst.w	 brktst
	bne	 _xdend2

	bsr	 auxin			 ; ヘッダーバイト取り込み
	tst.w	 nakflag
	bne	 _xdnext
	cmp.b	 #EOT,d0		 ; end of text?
	beq	 _xdend

	bsr	 auxin			 ; ブロック番号入力
	tst.w	 nakflag
	bne	 _xdnext
	move.b	 d0,blockn
	bsr	 auxin			 ; 反転ブロック番号入力
	tst.w	 nakflag
	bne	 _xdnext
	move.b	 d0,blockm
	clr.l	 d3			 ; D3 チェックサム・カウンター
	clr.l	 d4
	lea	 buffer,a0
_xd1:	cmp.l	 #LPACKET,d4
	bge	 _xd2
	bsr	 auxin
	move.b	 d0,(a0,d4)
	tst.w	 nakflag
	bne	 _xdnext
	add.b	 d0,d3
	addq.l	 #1,d4
	bra	 _xd1
_xd2:
	bsr	 auxin
	tst.w	 nakflag
	bne	 _xdnext
	cmp.b	 blockn,d2
	bne	 _xdnak
	cmp.b	 d3,d0
	bne	 _xdnak
	addq.b	 #1,d2
	bsr	 xwrite
	gprint	 tpack
	moveq.l	 #ACK,d0
	bsr	 putcom
	bra	 _xdnext	
_xdnak:
	gprint	 tpnak
	moveq.l	 #NAK,d0
	bsr	 putcom
	bra	 _xdnext
_xdend:
	fclose	 xflag
	tst	 d0
	bmi	 _xd_er
	bsr	 beep_on
	b_putmes #1,#43,#31,#6,clsmsg
	b_putmes #1,#50,#31,#44,xfid
	moveq.l	 #ACK,d0
	bsr	 putcom
	bsr	 bpsset
	bra	 _qxdown
_xdend2:
	bsr	 bpsset
	fclose	 xflag
	tst	 d0
	bmi	 _xd_er
	bsr	 beep_on
	b_putmes #6,#12,#31,#82,esc_exit
	bra	 _qxdown
_xd_er:	
	bsr	 beep_on
	b_putmes #6,#12,#31,#82,dwnerr
	bra	 _qxd1
_qxdown:
	gprint	 crlf
_qxd1:	bsr	 timing2 
	bsr	 msg_clr
	move.w	 (sp)+,dflag
	tst.w	 dflag
	bmi	 _qxd2
	b_putmes #1,#12,#31,#82,logmsg
_qxd2:
	func_pt	 #F7_x,#p1_pat
	jmp	 qcmd

*-----------------------------------------------*
*	Ｘモデムプロトコル・アップロード	*
*-----------------------------------------------*
xup:	equ	 *
	func_pt	 #F8_x,#clr_pat
	bsr	 beep_on
	move.w	 dflag,-(sp)
	move.w	 #-1,dflag	

	b_putmes #1,#12,#30,#82,xupmsg
	bsr	 consol31
	b_locate #36,#30
	tgets	 xfname			 ; ファイル名の入力
	bsr	 b_curoff
	bsr	 consol25
	b_locate cur_x,cur_x+2
	fopen	 xfid,#0		 ; ファイルオープン
	move.w	 d0,xflag
	bmi	 _xu_err		 ; －１の場合は失敗

	bsr	 xbpsset		 ; ﾌﾛｰ制御を除く
	bsr	 beep_on
	b_putmes #1,#12,#31,#82,xopnmsg
	bsr	 b_curon
	clr.w	 retrans
	move.b	 #1,blockn
	move.b	 #$FE,blockm
	bsr	 xread
_xunext:
	bsr	 brkchk			 ; 作業中止？
	tst.w	 brktst
	bne	 _xuend3

	bsr	 auxin2			 ; ヘッダーバイト取り込み
	cmp.b	 #CR,d0			 ; キャンセル？
	beq	 _xuend2
	cmp.b	 #ACK,d0		 ; 正常送信？
	beq	 _xuack
	cmp.b	 #NAK,d0		 ; 異常発生？
	beq	 _xunak
	bra	 _xunext		 ; 再度リトライ

_xunak: gprint	 tpnak			 ; 「?」異常発生マーク表示
	addq.w	 #1,retrans
	cmp.w	 #10,retrans		 ; リトライ１０回以上は中止
	bge	 _xuend2
	bsr	 xup_packet		 ; リトライ１パケット送信
	bra	 _xunext

_xuack:	gprint	 tpack			 ; 「*」正常送信マーク表示
	clr.w	 retrans		 ; リトライ・カウンタのクリア
	addq.b	 #1,blockn		 ; 次ブロック番号へ更新
	subq.b	 #1,blockm
	bsr	 xread			 ; ファイルから行入力
	tst.w	 d0
	beq	 _xuend			 ; 最後のパケットであれば終了
	bsr	 xup_packet		 ; １パケット送信
	bra	 _xunext
_xuend:
	moveq.l	 #EOT,d0		 ; 終了マークの送信
	bsr	 putcom
	bsr	 getcomw
	bsr	 bpsset
	fclose	 xflag			 ; ＵＰファイルのクローズ
	tst	 d0
	bmi	 _xu_clser
	b_putmes #1,#43,#31,#6,clsmsg
	b_putmes #1,#50,#31,#44,xfid
	bra	 _qxup
_xuend2:
	bsr	 bpsset
	fclose	 xflag
	tst	 d0
	bmi	 _xu_clser
	b_putmes #6,#12,#31,#82,up_err
	bra	 _qxup

_xuend3:
	bsr	 bpsset
	fclose	 xflag
	b_putmes #6,#12,#31,#82,esc_exit
	bra	 _qxup

_xu_err:b_putmes #6,#12,#31,#82,uplerr
	bsr	 beep_on
	bra	 _qxup0
_xu_clser:
	b_putmes #6,#12,#31,#82,cls_err
_qxup:	bsr	 beep_on
	gprint	 crlf
_qxup0:	bsr	 timing2
	bsr	 msg_clr
	move.w	 (sp)+,dflag
	tst.w	 dflag
	bmi	 _qxup1
	b_putmes #1,#12,#31,#82,logmsg
_qxup1:
	func_pt	 #F8_x,#p1_pat
	jmp	 qcmd

*-----------------------------------------------*
*	ＬＯＧＩＮ用ブレーク信号送出		*
*-----------------------------------------------*
sbreak:	equ	 *
	func_pt	 #F9_x,#clr_pat
	move.w	 dflag,-(sp)
	move.w	 #-1,dflag	

	bsr	 super_on

	moveq.l	 #$86,d0
	move.l	 #SCC_A,a1
	moveq.l	 #$05,d1
	trap	 #15
	moveq.l	 #$86,d0
	move.l	 #SCC_A,a1
	moveq.l	 #$fa,d1
	trap	 #15

	bsr	 timing

	moveq.l	 #$86,d0
	move.l	 #SCC_A,a1
	moveq.l	 #$05,d1
	trap	 #15
	moveq.l	 #$86,d0
	move.l	 #SCC_A,a1
	moveq.l	 #$ea,d1
	trap	 #15

	bsr	 super_off

	bsr	 beep_on
	b_putmes #1,#12,#31,#82,brkmsg
	bsr	 timing
	bsr	 msg_clr
	move.w	 (sp)+,dflag
	tst.w	 dflag
	bmi	 _qsb
	b_putmes #1,#12,#31,#82,logmsg

_qsb:	clr.l	 d0
	func_pt	 #F9_x,#p1_pat
	jmp	 qcmd

*---------------------------------------*
*	通信レートの変更		*
*	電話を掛ける			*
*---------------------------------------*
phone:	equ	 *
	move	 d1,-(sp)
	move	 d6,-(sp)		 ; ＢＵＳＹ回数カウント用レジスタ
	clr.l	 d6			 ; 〃初期化

	func_pt	 #F3_x,#clr_pat
	bsr	 beep_on
	b_putmes #1,#12,#30,#82,cntmod_msg
	move.w	 dflag,-(sp)
	move.w	 #-1,dflag	
	bsr	 consol31
	popup_menu #2,#2,#75,#21,tellist
	b_putmes #1,#19,#30,#75,slctmsg
	b_locate #31,#30
	bsr	 keyinw
	move.w	 d0,-(sp)
	bsr	 putch
	bsr	 consol25
	b_locate cur_x,cur_x+2
	move.w	 (sp)+,d0

	cmp.b	 #'Z',d0		 ; Ｚ or ｚ？
	beq	 itelset
	cmp.b	 #'z',d0
	beq	 itelset

_ph00:	sub.w	 #'1',d0		 ; 文字を数値に変換
	bmi	 _ph4
	cmp.b	 #6,d0
	beq	 _tl_cut
	cmp.b	 #9,d0			 ; 'Ａ'以上か？
	blt	 _ph01
	subq.w	 #7,d0
	cmp.b	 #41,d0			 ; 'ａ'以上か？
	blt	 _ph001
	sub	 #32,d0
_ph001:	cmp.b	 nphone,d0
	bge	 _ph4

_atx4_out:
	move.l	 d0,-(sp)
	lea	 ind_mode,a1
_atx4_1:move.b	 (a1)+,d0
	beq	 _atx4_2
	bsr	 putcom
	bra	 _atx4_1
_atx4_2:
	bsr	 getcomw
	tst	 nakflag
	beq	 _atx4_3
	bsr	 beep_on
	b_putmes #6,#12,#31,#82,mdofmsg
	bsr	 timing2
	bsr	 msg_clr
	addq.l	 #4,sp
	bra	 _ph4
_atx4_3:bsr	 result_r
	move.l	 (sp)+,d0

_ph01:
	lea	 phtable,a0
_ph0:	tst.b	 d0
	beq	 _ph1
	addq.l	 #4,a0			 ; 次のポインター検索
	subq.w	 #1,d0
	bra	 _ph0
_ph1:	move.l	 a0,-(sp)
	move.l	 (a0),a1		 ; 通信先のデータ先頭アドレス
	tst.w	 (a1)			 ; 通信モードの設定は如何に？
	beq	 _ph1a			 ; 値が０なら何もしない。
	move.w	 (a1),d0
	bsr	 setmode		 ; 通信モードの設定
	bsr	 bpsset

_ph1a:	moveq.l	 #2,d1			 ; ＡＴコマンド、ダイヤル文字列の先頭アドレス
_ph2:	move.b	 (a1,d1),d0		 ; Nullまでを送出
	beq	 _ph3
	bsr	 putcom
	addq.l	 #1,d1
	bra	 _ph2

_ph3:	moveq.l	 #CR,d0
	bsr	 putcom
	cmp.l	 #2,d1
	bgt	 _ph5
	bra	 _phout

_ph4:	bsr	 cls_menu
	move.w	 (sp)+,dflag
	tst.w	 dflag
	bmi	 _ph4_1
	b_putmes #1,#12,#31,#82,logmsg
_ph4_1:	func_pt	 #F3_x,#p1_pat
	bsr	 beep_on
	b_locate cur_x,cur_x+2
	move	 (sp)+,d6
	move	 (sp)+,d1
	jmp	 qcmd

*	オートリダイヤル（ＡＴコマンドの実行）

_ph5:	bsr	 getcomw
	tst	 nakflag
	bne	 _offmsg		 ; 時間内に読み込めなければ、terminal modeヘ
	cmp.b	 #CR,d0
	beq	 _ph5_1
*	bsr	 gout			 ; putch
	bra	 _ph5

_ph5_1:	addq.w	 #1,d6			 ; ＢＵＳＹ回数表示
	move.l	 a0,-(sp)
	move.w	 d6,d0
	lea	 itoabuf,a0
	bsr	 itoa
	move.l	 (sp)+,a0
	b_putmes #1,#12,#31,#13,itoabuf
_ph5_0:	lea	 result,a4
	clr.w	 d5
	move.l	 #CALLCNT,d7
_ph5_2:	subq.l	 #1,d7
	beq	 _callof		 ; 応答しないので処理をストップ
	bsr	 lofcom
	tst	 d0
	beq	 _escchk		 ; キーボードからの入力？
	bsr	 getcom
	cmp.b	 #CR,d0
	beq	 _ph5_2
	cmp.b	 #LF,d0
	beq	 _lfcout
	move.b	 d0,(a4)+
	bra	 _ph5_2

_escchk:bsr	 keyin			 ; エスケープＫＥＹが押されたかチェック
	tst	 d0
	beq	 _ph5_2
	cmp.b	 #ESC,d0		 ; エスケープなら処理中止。terminal modeへ
	beq	 _callof
	clr.l	 d0
	bra	 _escchk

_lfcout:addq.w	 #1,d5
	cmp.w	 #2,d5
	bcs	 _ph5_2		
	clr.b	 (a4)
	cmp.b	 #'B',result		 ; 'Ｂ'usy ? 
	beq	 _ph6_0
	cmp.b	 #'N',result		 ; 'Ｎ'o carrier etc. ?
	beq	 _ncarry
	cmp.b	 #'C',result		 ; 'Ｃ'onnect ?
	beq	 _connect
	bsr	 msg_clr
	bra	 _phout			 ; Terminal mode へ

_ph6_0:	move.l	 (sp)+,a0
_ph6:
	b_putmes #6,#26,#31,#69,busymsg
	move.l	 #LCOUNT,d0
_phloop:subq.l	 #1,d0
	bne	 _phloop
	bra	 _ph1			 ; 再実行

_connect:
	bsr	 beep_on
	b_putmes #1,#26,#31,#69,cnctmsg
	bra	 _phout
	
_callof:bsr	 beep_on
	b_putmes #6,#12,#31,#82,limtmsg
	moveq.l	 #CR,d0			 ; 呼び出し中止（コードに意味無し）
	bsr	 putcom
	bsr	 result_r
	bsr	 msg_clr
	bra	 _phout
_ncarry:
	bsr	 beep_on
	bsr	 b_curoff
	b_putmes #6,#12,#31,#82,limtmsg
	bsr	 timing2
	bsr	 msg_clr
	bra	 _phout
_offmsg:
	bsr	 result_r
	bsr	 beep_on
	b_putmes #6,#12,#31,#82,mdofmsg
	bsr	 timing2
	bsr	 msg_clr
_phout:	move.l	 (sp)+,a0
	bra	 _ph4

itelset:movem.l	 d0/a0-a1,-(sp)		 ; Ｉを選択した場合の通信モード＆電話番号セット
	bsr	 consol31
	bsr	 beep_on
	b_putmes #1,#19,#30,#68,telmode
_it0:
	b_locate #41,#30
	bsr	 keyinw
	cmp.b	 #'1',d0
	blt	 _it0
	cmp.b	 #'6',d0
	bgt	 _it0
	sub	 #'1',d0
	lea	 _pd1,a0
	mulu	 #4,d0
	move.w	 (a0,d0),_pd35

_it1:	bsr	 beep_on		 ; 電話番号入力
	b_putmes #1,#19,#30,#68,tel_no
	b_locate #33,#30
	tgets	 gtelbuf 
	tst	 d0
	beq	 _it1
	bsr	 b_curoff
	lea	 gtelbuf+2,a0
	lea	 _pd36+4,a1
_it2:	move.b	 (a0)+,(a1)+
	dbra	 d0,_it2
	movem.l	 (sp)+,d0/a0-a1
	bra	 _ph00

_tl_cut:equ	 *
	b_locate cur_x,cur_x+2
	bsr	 b_curoff
	lea	 _pd7+2,a0
	clr.w	 d0
	move.w	 #2,d1
_tlc1:	move.b	 (a0)+,d0
	bsr	 putcom
	dbra	 d1,_tlc1

	bsr	 getcomw
	tst	 nakflag
	bne	 _tlc4
	bsr	 result_r
_tlc2:	move.b	 (a0)+,d0
	beq	 _tlc3
	bsr	 putcom
	bra	 _tlc2
_tlc3:	bsr	 result_r
	bsr	 beep_on
	b_putmes #6,#12,#31,#82,telcutmsg
	bsr	 timing2
	bsr	 msg_clr
	gprint	 crlf
_tlc4:
	bsr	 b_curon
	bra	 _ph4

*----------------------------*
*	コマンドの実行	     *		
*----------------------------*
doscom:	equ	 *
	func_pt	 #F10_x,#clr_pat
	bsr	 beep_on
	b_putmes #1,#12,#30,#82,entcom	; コマンド入力催促
	bsr	 consol31
	b_locate #22,#30
	tgets	 comstr
	tst.b	 entstr			; 文字が入力されているか？
	bne	 dosc1
	bsr	 beep_on
	func_pt	 #F10_x,#p1_pat
	rts
dosc1:
	bsr	 consol25
	vpage	 #0
	print	 cls
	clr.b	 comstr+1
	lea	 p1_buf,a1
	lea	 f1_buf,a0		; command /c の追加
	lea	 cmdtext,a1
dosc_1:	move.b	 (a1)+,(a0)+
	bne	 dosc_1
	subq.l	 #1,a0
	lea	 entstr,a1		; 入力文字列の追加
dosc_2:	move.b	 (a1)+,(a0)+
	bne	 dosc_2
	clr.b	 (a0)
	lea	 f1_buf,a0		; FIL
	lea	 p1_buf,a1		; P1
	bsr	 exec_2
	tst.l	 d0			; 実行可能か？
	bmi	 dosErr			; だーめ！
dosexec:
	movem.l	 d0-d7/a0-a6,-(sp)
	bsr	 time_off
	lea	 funcbuf,a0
	bsr	 init2_1
	bsr	 init4
	funcset  #256,funcbuf
	movem.l	 (sp)+,d0-d7/a0-a6

	bsr      exec_0

	print    retmsg
	bsr      keyinw
	fnc_line #3
	funcset  #256,setfunc
	moveq.l	 #$2a,d0
	moveq.l	 #2,d1
	trap	 #15
	apage	 #0
	tst.l	 d0
	bne	 _dexec1
	crtmod	 #-1
	cmp.l	 #$10,d0
	bne	 _dexec1
	vpage	 #1
	bsr	 consol25
	bra	 _dexec2

_dexec1:bsr	 init1
	bsr	 b_curoff
	gprint	 cls	 
_dexec2:bsr	 init2
	lea	 func1,a0
	bsr	 init2_1
	cmp.w	 #96,X_SIZE
	beq	 _dexec3
	bsr	 init3
_dexec3:bsr	 init4
	bsr	 time_off
	bsr	 time_on
	bsr	 beep_on
	bsr	 b_curon
	rts
*
dosErr: bsr	 beep_on
	apage	 #0
	vpage	 #1
	bsr	 consol25
	b_putmes #2,#12,#31,#82,doscErr
	bsr	 timing2
	bsr	 msg_clr
	tst.w	 dflag
	bmi	 de_exit
	b_putmes #1,#12,#31,#82,logmsg
de_exit:
	func_pt	 #F10_x,#p1_pat
	rts

*----------------------------*
*	画面サイズ変更	     *
*----------------------------*
screen:	equ	 *
	func_pt	 #F1_x,#clr_pat
	movem.l	 d0-d7/a0-a6,-(sp)
	lea	 X_SIZE,a0
	cmp.w	 #80,(a0)
	beq	 width96
width80:move.w	 #80,0(a0)
	move.w	 #79,2(a0)
	move.l	 #$27f,4(a0)
	move.l	 #$300,8(a0)
	bsr	 init3	 
	b_putmes #1,#12,#29,#3,x80_msg
	bra	 sc_exit

width96:move.w	 #96,0(a0)
	move.w	 #95,2(a0)
	move.l	 #$2ff,4(a0)
	move.l	 #$200,8(a0)
	b_putmes #1,#12,#29,#3,x96_msg
	bsr	 init3
sc_exit:
	bsr	 beep_on
	bsr	 timing
	bsr	 timing
	movem.l	 (sp)+,d0-d7/a0-a6
	func_pt	 #F1_x,#p1_pat
	jmp	 qcmd

*-----------------------------------------------*
*	TT.SのGPOUT.INCルーチン	(ESCｼｰｹﾝｽ用)	*
*-----------------------------------------------*
return_err:
return_0:
	movem.l	(sp)+,d0-d7/a0-a4
	rts

gout:	movem.l	d0-d7/a0-a4,-(sp)
e_gpout:
	lea	cur_x,a3	;d0= character code.

	cmp.w	#0,22(a3)
	bne	kanji_ok	;shift jis 2byte chr.
	
	cmp.b	#0,6(a3)	;if esc_flag>0
	bne	escape		;   then escape

	cmp.w	#$20,d0		;if par1<$20
	bcs	control		;     then control
	cmp.w	#$7f,d0		;if par1<$127
	beq	control		;     then control

	cmp.w	#$80,d0
	bcs	normal
	cmp.w	#$a0,d0
	bcs	shift_jis
	cmp.w	#$e0,d0
	bcs	normal
shift_jis:
	move.b	d0,22(a3)	;shift jis 1byte save
	 bra	return_0
*
kanji_ok:
	move.b	22(a3),d6
	or.w	22(a3),d0
	clr.w	22(a3)		;shift jis clear
	lea	symbol_par,a0

	cmp.b	#$80,d6
	bcs	x_16dot
	beq	x_8dot
	cmp.b	#$f0,d6
	bcs	x_16dot
x_8dot: moveq.l	#1,d6
	bra	kanji_ok2
x_16dot:moveq.l	#2,d6
kanji_ok2:
	move.w	d0,14(a0)
	clr.b	16(a0)
	bra	ascii0
*
normal:
	lea	symbol_par,a0
ascii:
	moveq.l	#1,d6
	clr.l	14(a0)
	move.b	d0,15(a0)		
ascii0:
	move.w	(a3),d0
	add.w	d6,d0

	cmp.w	X_SIZE,d0	;if x<=96
	bls	gprint0 	;     then not new_line

	bsr	new_line
gprint0:
	cmp.w	#0,d6
	beq	gpout_end

	bsr	symbol		;non new line normal display
	bne	return_err	;  if err then err_return
	add.w	d6,(a3)		;x colum++
	move.w	(a3),d0
	cmp.w	X_SIZE,d0
	bcs	gpout_end
	clr.w	(a3)
	bsr	new_line
gpout_end:
	bsr 	cursor		;cursor +

	bra	return_0	;normal return

*///////////////////////////////////////////////////
*
*		Control code execute.
*
*///////////////////////////////////////////////////
control:
	cmp.b	#$7f,d0		;if code=DEL then code=$20
	bne	cntrl0		; table(x)  x=$7f --> $20.
	move.b	#$20,d0
cntrl0:
	lea	ctl_tbl,a0	;jsr (ctrl_tbl+code*4)
	lsl.l	#2,d0

	movea.l	(a0,d0),a0
	jsr	(a0)
	bra	gpout_end
*
*********	control subroutine.	***************
*
bel:
	bsr	beep_on
	rts
*
bs:
	move.w	0(a3),d0	;get d0 <-- cur_x
	move.w	2(a3),d1	;    d1 <-- cur_y
	cmp.w	#0,d0		;if cur_x=0 then bs1
	beq	bs1		;
	subq.w	#1,d0		;  else cur_x=cur_x-1: goto bs9
	bra	bs9		;
bs1:
	cmp.w	4(a3),d1	;if win_y=cur_y then bs9
	beq	bs9
	subq.w	#1,d1		;  cur_y=cur_y-1:cur_x=95
	move.w	X_SIZE+2,d0
bs9:
	move.w	d0,0(a3)	;cur_x,cur_y update
	move.w	d1,2(a3)
	rts
*
ht:
	move.w	0(a3),d0	;cur_x=cur_x and fff8
	andi.w	#$fff8,d0
	addq.w	#8,d0		; cur_x++8
	cmp.w	X_SIZE+2,d0	; 95 colum over ??
	bls	ht9		;   no! ht9

	bsr	new_line	;   yes! newline or scroll.
	rts
ht9:
	move.w	d0,0(a3)	; cur_x update
	rts
*
lf:
	bsr	lf_ope		; no cange x newline
	rts
*
vt:
	move.w	2(a3),d0	;if cur_y=win_y then end
	cmp.w	4(a3),d0
	beq	vt9

	subq.w	#1,2(a3)	;  else cur_y --
vt9:
	rts
*
ff:
	move.w	X_SIZE+2,a4
	cmp.w	0(a3),a4
	bcc	ff1

*	move.l	(sp)+,d6
	bsr	new_line	;  else neline
	rts
ff1:
*	move.l	(sp)+,d6
	addq.w	#1,0(a3)	;cur_x++
	rts
*
cr:
	clr.w	(a3)		;cur_x=0
	rts
*
sub:
	lea	box_par,a1	;box(0,0,767,495,10(a3))
	clr.l	(a1)		;   10(a3)=back color
	move.w	X_SIZE+6,4(a1)
	move.w	#399,6(a1)
	clr.w	8(a1)		;*move.w  10(a3),8(a1)*
	move.l	#$ba,d0
	trap	#15

	move.l	#$ba,d0
	move.w	#400,2(a1)	;画面外クリア
	move.w	#1023,6(a1)
	clr.w	8(a1)
	trap	#15

	move.l	#$b3,d0		;display window top 0,0
	clr.l	d1
	clr.l	d2
	clr.l	d3
	trap	#15

	clr.w	0(a3)		;cur_x,cur_y,win_y=0
	clr.w	2(a3)
	clr.w	4(a3)
	rts
*
esc:	move.b	#1,6(a3)	;sequence no. set (esc_1)
	rts
*
rs:
	clr.w	0(a3)		;cur_x=0
	move.w	4(a3),d0	;cur_y=win_y
	move.w	d0,2(a3)
	rts
*
null:	rts			;null operation.

*///////////////////////////////////////
*
*	<<< escape execute >>>
*
*	esc *,D,E,M	[esc_1] --> end
*
*	esc =		[esc_1] --> [esc_2] --> [esc_3] -->end
*
*	esc [		[esc_1] --> [esc_4] --> end
*				^	    |
*				^----[ ; ]--/
*	esc [>		[esc_1] --> [esc_4} --> [esc_5] --> [esc_6] --> end
*
*///////////////////////////////////////
escape:
	clr.l	d1		;sequence no. jump.
	move.b	6(a3),d1
	subq.b	#1,d1
	lsl.l	#2,d1
	lea	seq_vect,a1
	move.l	(a1,d1),a1
	jmp	(a1)
*
***********	Sequence no. 1		*************
*
esc_1:
	cmp.b	#'*',d0
	beq		c1_1
	cmp.b	#'D',d0
	beq		c1_2
	cmp.b	#'E',d0
	beq		c1_3
	cmp.b	#'M',d0
	beq		c1_4
	cmp.b	#'=',d0
	beq	c1_5
	cmp.b	#'[',d0
	beq	c1_6

ret_esc:clr.b	6(a3)		;sequence no. clear.
	lea	num_Q,a0	;Q_list reset.
	bsr	Q_inz
	lea	bin_Q,a0
	bsr	Q_inz

next_esc:
	bra	gpout_end	;next parameter or esc end.

*
c1_1:
	bsr	sub		;esc *  (same ctrl/sub)
	bra	ret_esc

*
c1_2:
	bsr	lf		;esc D  (same ctrl/lf)
	bra	ret_esc
*
c1_3:
	bsr	lf		;esc E  (same cr+lf)
	bsr	cr
	bra	ret_esc

*
c1_4:
	move.w	2(a3),d0	;esc M
	cmp.w	4(a3),d0	;cur_y : window y 
	beq	c1_40		;if equal then scroll down
	subq.w	#1,d0
	andi.w	#$3f,d0
	move.w	d0,2(a3)
	bra	ret_esc

c1_40:	bsr	sc_down
	bra	ret_esc

*
c1_5:
	move.b	#2,6(a3)	;esc =lc
	bra	next_esc	;sequence 2 set.

*
c1_6:
	move.b	#4,6(a3)	;esc [....
	bra	next_esc	;sequence 4 set.
*
**************	    Sequence no. 2	***************
*
esc_2:
	sub.b	#$20,d0		;esc =l
	move.b	d0,7(a3)	; l save
	move.b	#3,6(a3)	;sequence 3 set.
	bra	next_esc

**************	    Sequence no. 3	***************

esc_3:
	sub.b	#$20,d0		;esc =lc

	bsr	sub_cur

	bra	ret_esc		; esc =lc normal end

**************	    Sequence no.4	***************

esc_4:
	cmp.b	#'0',d0		;if d0<'0'
	bcs	no_num		;  then no_number
	cmp.b	#'9',d0		;if d0<='9'
	bls	number		;  then number
no_num:	
	lea	esc4_chr,a1
	move.l	(a1)+,d1
	subq.l	#1,d1
chk:	cmp.b	(a1)+,d0
	beq	found
	dbra	d1,chk

	bra	ret_esc		;illgal esc code.
found:
	lsl.l	#2,d1
	lea	esc4_vect,a1
	move.l	(a1,d1),a1

	move.l	a1,-(sp)	;last value calc & Q.
	bsr	val
	move.l	(sp)+,a1

	jmp	(a1)
**************
number:
	lea	num_Q,a0	;number--> num_Q put.
	bsr	Q_put
	bra	next_esc
**************
e4_coron:
	bra	next_esc	;next parameter
**************
e4_e5:
	move.b	#5,6(a3)	;esc [>....
	bra	next_esc	;sequence 5 set.

************************************************** esc[*A
e4_A:
	lea	bin_Q,a0
	bsr	Q_get
	cmp.b	#0,d0
	beq	e4_A_0
	subq.b	#1,d0
e4_A_0:
	move.w	d0,d1
e4_A_1:
	bsr	vt
	dbra	d1,e4_A_1
	bra	ret_esc
************************************************** esc[*B
e4_B:
	lea	bin_Q,a0
	bsr	Q_get
	cmp.b	#0,d0
	beq	e4_B_0
	subq.b	#1,d0
e4_B_0:
	move.w	4(a3),d1
	add.w	Y_SIZE,d1
e4_B_1:
	cmp.w	2(a3),d1
	bls	e4_B_9
	addq.w	#1,2(a3)
	dbra	d0,e4_B_1
e4_B_9:
	bra	ret_esc
************************************************** esc[*C
e4_C:
	lea	bin_Q,a0
	bsr	Q_get
	cmp.b	#0,d0
	bne	e4_C_0
	addq.b	#1,d0
e4_C_0:
	add.w	0(a3),d0
	cmp.w	X_SIZE+2,d0
	bls	e4_C_1
	move.w	X_SIZE+2,d0
e4_C_1:
	move.w	d0,0(a3)
	bra	ret_esc
************************************************** esc[*D
e4_D:
	lea	bin_Q,a0
	bsr	Q_get
	cmp.b	#0,d0
	bne	e4_D_0
	addq.b	#1,d0
e4_D_0:
	sub.w	d0,0(a3)
	bmi	e4_D_1
	bra	ret_esc
e4_D_1:
	clr.w	0(a3)
	bra	ret_esc
************************************************** esc[*;*H
e4_H:
	lea	bin_Q,a0
	bsr	Q_get
	cmp.b	#1,d1
	beq	e4_H_9

	cmp.b	#0,d0
	beq	e4_H_2
	subq.b	#1,d0
e4_H_2:
	move.b	d0,7(a3)
	bsr	Q_get
	cmp.b	#0,d0
	beq	e4_H_3
	subq.b	#1,d0
e4_H_3:
	bsr	sub_cur
e4_H_9:
	bra	ret_esc
************************************************** esc[*J execute.
e4_J:
	lea	bin_Q,a0
	bsr	Q_get

	cmp.b	#0,d0
	beq	e4_J0

	cmp.b	#1,d0
	beq	e4_J1

	cmp.b	#2,d0
	beq	e4_J2

	bra	ret_esc
************************************************** esc[0J
e4_J0:
	bsr	lend_clr	;(esc[0K)
	move.w	Y_SIZE+2,a4
	cmp.w	2(a3),a4
	beq	e4_J09
	bsr	y_wy		;calc (y-wy)-->d3
	clr.l	d3
	move.w	Y_SIZE+6,d3
	sub.l	d2,d3

	addq.l	#1,d1
	lsl.l	#4,d1
	bsr	gea_cnv
	move.l	d1,a1
e4_J03:
	bsr	clear64k
	dbra	d3,e4_J03
e4_J09:
	bra	ret_esc
************************************************** esc[1J
e4_J1:
	bsr	y_wy
	cmp.l	#0,d2
	beq	e4_J19

	subq.l	#1,d2
	move.l	d2,d3
	clr.l	d1
	move.w	4(a3),d1
	lsl.l	#4,d1
	bsr	gea_cnv
	move.l	d1,a1
e4_J12:
	bsr	clear64k
	dbra	d3,e4_J12
e4_J19:
	bsr	ltop_clr		;(esc[1K)
	bra	ret_esc
************************************************** esc[2J
e4_J2:
	bsr	sub
	bra	ret_esc
************************************************** esc[*K executing.		
e4_K:
	lea	bin_Q,a0
	bsr	Q_get

	cmp.b	#0,d0
	beq	e4_K0

	cmp.b	#1,d0
	beq	e4_K1

	cmp.b	#2,d0
	beq	e4_K2

	bra	ret_esc
************************************************** esc[012K
e4_K0:
	bsr	lend_clr
	bra	ret_esc
*
e4_K1:
	bsr	ltop_clr
	bra	ret_esc
*
e4_K2:
	clr.l	d1
	move.w	2(a3),d1
	lsl.l	#4,d1
	bsr	gea_cnv
	move.l	d1,a1
	bsr	clear64k
	bra	ret_esc
**************************************************
e4_L:
	bra	ret_esc

**************************************************
e4_M:
	bra	ret_esc

**************************************************
e4_m:
	lea	bin_Q,a0
e4_m0:
	bsr	Q_get
	cmp.b	#0,d0		;if esc[0m then inz
	beq	attr_inz
	cmp.b	#4,d0		;if esc[4m then under line
	beq	under_line
	cmp.b	#7,d0		;if esc[7m then rev
	beq	attr_rev
	cmp.b	#30,d0		;if esc[30m - esc[37m then
	bcs	e4_m9		;  then nml_color
	cmp.b	#37,d0
	bls	attr_nml_color
	cmp.b	#41,d0		;if wsc[41m - esc[47m then 
	bcs	e4_m9		;  then rev_color
	cmp.b	#47,d0
	bls	attr_rev_color
e4_m9:
	cmp.b	#0,d1		; parameter end??
	beq	e4_m0		;   no! then next
	bra	ret_esc
*
attr_inz:
	move.w	#15,8(a3)	;chr color  = 15
	clr.w	10(a3)		;back color = 0
	clr.b	24(a3)		;under line flag reset
	bra	e4_m9
*
under_line:
	move.b	#$ff,24(a3)	;under line flag set
	bra	e4_m9
*
attr_rev:
	move.w	8(a3),d0	;back color : chr color change.
	move.w	10(a3),d2
	move.w	d0,10(a3)
	move.w	d2,8(a3)
	bra	e4_m9
*
attr_nml_color:
	subi.b	#30,d0
	andi.w	#15,d0
	lsl.w	#1,d0
	lea	color_tbl,a1
	move.w	(a1,d0.w),d0
	move.w	d0,8(a3)	;chr color  = color tbl((d0-#$30)*2)
	clr.w	10(a3)		;back color = 0
	bra	e4_m9
*
attr_rev_color:
	subi.b	#40,d0
	andi.w	#15,d0
	lsl.w	#1,d0
	lea	color_tbl,a1
	move.w	(a1,d0.w),d0
	move.w	d0,10(a3)	;back color  = color tbl((d0-#$40)*2)
	clr.w	8(a3)		;chr color   = 0
	bra	e4_m9
**************************************************
e4_s:
	move.w	#1,12(a3)	;esc[u enable flag on
	move.w	0(a3),d0
	move.w	d0,14(a3)	;copy cur_x
	bsr	y_wy
	move.w	d2,16(a3)	;copy y-wy
	move.w	8(a3),d0
	move.w	d0,18(a3)	;copy chr color
	move.w	10(a3),d0
	move.w	d0,20(a3)	;copy back color
	bra	ret_esc
**************************************************
e4_u:
	cmp.w	#0,12(a3)
	 beq	e4_u_9
	move.w	#0,12(a3)	;clear enable flag
	move.w	14(a3),d0
	move.w	d0,0(a3)	;restore cur_x
	move.w	4(a3),d0
	move.w	16(a3),d1
	add.w	d1,d0
	move.w	d0,2(a3)	;restore wy+(copy y-wy)
	move.w	18(a3),d0
	move.w	d0,8(a3)	;restore chr color
	move.w	20(a3),d0
	move.w	d0,10(a3)	;restore back color
e4_u_9:
	bra	ret_esc

**************************************************
esc_5:
	cmp.b	#'5',d0
	bne	ret_esc		;if not esc[>5 then illigal
	move.b	#6,6(a3)	;  sequence 6 set.
	bra	next_esc
**************************************************
esc_6:
	cmp.b	#'l',d0
	beq	e6_l		;if esc[>5l then e6_l
	cmp.b	#'h',d0
	beq	e6_h		;if esc[>5h then e6_h

	bra	ret_esc		;  else esc end
*
e6_l:
	move.w	#17,-(sp)
	dc.w	$ff23		;cursor on
	addq.l	#2,sp
	bra	ret_esc
*
e6_h:
	move.w	#18,-(sp)
	dc.w	$ff23		;cursor off
	addq.l	#2,sp
	bra	ret_esc


*/////////////////////////////////////////////
*
*		common subroutine
*
*/////////////////////////////////////////////
*
ltop_clr:
	cmp.w	#0,0(a3)
	beq	lclr_ret

	lea	box_par,a1
	clr.w	0(a1)		;x1=0
	move	0(a3),d0
	addq.w	#1,d0
	lsl.l	#3,d0
	subq.l	#1,d0
	move.w	d0,4(a1)	;x2=(cur_x+1)*8-1

lclr_y:	move.w	2(a3),d0
	lsl.l	#4,d0
	move.w	d0,2(a1)	;y1=cur_y*16
	addi.w	#15,d0
	move.w	d0,6(a1)	;y2=y1+15
	move.w	10(a3),d0	; back color set
	move.w	d0,8(a1)
	move.l	#$ba,d0		;box_fill
	trap	#15
lclr_ret:
	rts
*
lend_clr:
	move.l	d6,-(sp)
	move.w	X_SIZE+2,d6
	cmp.w	0(a3),d6
	bne	lend_c1
	move.l	(sp)+,d6
	bra	lclr_ret

lend_c1:
	move.l	(sp)+,d6
	lea	box_par,a1
	move.w	0(a3),d0
	lsl.l	#3,d0
	move.w	d0,0(a1)	;x1=cur_x*8
	move.w	X_SIZE,d0
	lsl.l	#3,d0
	subq.l	#1,d0
	move.w	d0,4(a1)	;x2=96*8-1
	bra	lclr_y
*
new_line:
	clr.w	0(a3)		;x colum=0
lf_ope:
	move.w	2(a3),d4
	addq.w	#1,d4		;y colum++
	andi.w	#$3f,d4		;y=y and $3f
	move.w	d4,2(a3)

	move.w	4(a3),d5	;*** scroll check.
	cmp.w	d4,d5		;
	beq	ret_newl	;if line kankaku=0 then end
	bhi	nl0		;if d5>d4 then nl0
	sub.w	d5,d4		;d4=d4-d5
	bra	nl1

nl0:	sub.w	d4,d5		;d5=d5-d4
	cmp.w	Y_SIZE+4,d5	;**line kankaku<36 then scroll
	bcs	scroll
	bra	ret_newl
nl1:
	cmp.w	Y_SIZE,d4	;**line kankaku< 29
	bcs	ret_newl	;     then end
scroll:
	move.w	4(a3),d1	;get disp start line (dl)
	addq.w	#1,d1		;dl++
	andi.l	#$3f,d1		;dl=dl and $3f
	move.w	d1,4(a3)	;set dl
	lsl.l	#4,d1		;dl[0000]  (*16) dot convert.
	move.l	d1,d3		;d3 copy
	bsr	gea_cnv		;dot(dl)--> GRAM adrs convert.
	addi.l	#$c0000,d1
	andi.l	#$dfffff,d1	;(scroll new line)

*	move.l	d1,a1		;指定アドレスから１行クリア
*	bsr	clear64k

*	move.l	a1,d1
	addi.l	#$38000,d1
	andi.l	#$dfffff,d1
	move.l	d1,a1

	move.l	d3,-(sp)
	move.w	#16-1,d3
	bsr	super_on
scroll1:move.l	#$17f,d2
scroll0:clr.l	(a1)+
	dbra	d2,scroll0
	add.l	#$200,a1
	dbra	d3,scroll1
	bsr	super_off
	move.l	(sp)+,d3

	move.l	#$b3,d0		;display address change.
	clr.l	d1		;   (scroll)
	clr.l	d2
	trap	#15
ret_newl:
	rts
*
gea_cnv:
	lsl.l	#8,d1
	lsl.l	#3,d1
	addi.l	#$c00000,d1	;d1=$c00000+dl*16*1024
	rts
*
clear64k:	
	movem.l	d1-d3,-(sp)
	move.w	10(a3),d1
	move.w	#16-1,d3
	bsr	super_on
cl_lop1:move.l	X_SIZE+4,d2
cl_lop2:move.w	d1,(a1)+
	dbra	d2,cl_lop2
	add.l	X_SIZE+8,a1
	dbra	d3,cl_lop1

	bsr	super_off

	move.l	a1,d2
	andi.l	#$dfffff,d2
	move.l	d2,a1
	movem.l	(sp)+,d1-d3
	rts
*
**	文字列をグラフィック画面に描く
*
symbol:
	move.w		2(a3),d1	;*Ｙ座標
	move.w		#1024*2*16,d0
	mulu.w		d0,d1
	clr.l		d0
	move.w		(a3),d0		;*Ｘ座標
	lsl.l		#4,d0
	add.l		d0,d1
	move.l		#$c00000,a1
	add.l		d1,a1		;*ＧＲＡＭ上のアドレス
	move.w		8(a3),d2	;*色
	move.w		chr_buf,d1
call_SYM:
	bsr		SYM2		;*高速シンボルルーチン

*	lea		symbol_par,a1	;*ＳＹＭＢＯＬ用パラメータ
	lea		box_par,a2	;*ボックスクリア用パラメータ
	move.w		(a3),d1		;*Ｘ座標
	lsl.l		#3,d1
*	move.w		d1,(a1)		;*ドット座標に変換
	move.w		d1,(a2)
	move.w		d6,d7		;*Ｄ６はＡＮＫならば１、漢字ならば２が入っている
	lsl.w		#3,d7
	subq.w		#1,d7
	add.w		d7,d1
	move.w		d1,4(a2)	;ボックスクリアの終点Ｘ座標

	move.w		2(a3),d1	;*Ｙ座標
	lsl.l		#4,d1
*	move.w		d1,2(a1)	;ドット座標に変換
	move.w		d1,2(a2)
	addi.w		#15,d1
	move.w		d1,6(a2)	;*ボックスクリアの終点Ｙ座標

*	move.l		#$ba,d0		;*ボックスクリア（スペース表示）
*	lea		box_par,a1
*	move.w		10(a3),d1	;*背景色
*	move.w		d1,8(a1)
*	trap		#15		;*ＩＯＣＳコール

*	move.l		#$bd,d0		;*ＳＹＭＢＯＬ
*	lea		symbol_par,a1
*	move.w		8(a3),d1	;*キャラクターカラー
*	move.w		d1,10(a1)
*	trap		#15

	cmp.b		#0,24(a3)	;*アンダーラインか？
	beq		symbol_9

	lea		box_par,a1	;*アンダーライン描画
	move.w		6(a1),2(a1)
	move.w		8(a3),8(a1)
*	move.w		#15,8(a1)
	move.l		#$b8,d0
	trap		#15
symbol_9:
	clr.l		d0
	rts
*
sc_down:
	move.w	4(a3),d1
	subq.w	#1,d1
	andi.l	#$3f,d1
	move.w	d1,4(a3)
	move.w	d1,2(a3)
	lsl.l	#4,d1
	move.l	d1,d3

	bsr	gea_cnv

	move.l	d1,a1
	bsr	clear64k

	addi.l	#$c8000,d1
	andi.l	#$dfffff,d1

	move.l	d1,a1
	bsr	clear64k

	move.l	#$b3,d0
	clr.l	d1
	clr.l	d2
	trap	#15
	rts
*
sub_cur:
	cmp.b	X_SIZE+3,d0	; c 95 colum over?
	bls	sbcur1
	move.b	X_SIZE+3,d0
sbcur1:	clr.w	d1
	move.b	7(a3),d1	; l restore
	cmp.b	Y_SIZE+3,d1	; l 29 line over?
	bls	sbcur2		;
	move.b	Y_SIZE+3,d1
sbcur2:	add.w	4(a3),d1	; y window+l
	andi.w	#$3f,d1		; over cut
	move.w	d0,0(a3)	; colum set
	move.w	d1,2(a3)	; line set
	rts
*
val:
	lea	num_Q,a0
	move.l	a0,a1
	bsr	bin_cnv

	lea	bin_Q,a0
	bsr	Q_put

	move.l	a1,a0
	bsr	Q_inz
	rts
*
bin_cnv:
	clr	d3
bin_0:
	lsl.l	#1,d3
	move.l	d3,d2
	lsl.l	#2,d3
	add.l	d2,d3
	bsr	Q_get

	cmp.b	#2,d1
	beq	bin_9

	sub.l	#$30,d0
	add.l	d0,d3
	cmp.b	#1,d1
	bne	bin_0
bin_9:
	move.l	d3,d0
	rts
*
Q_inz:
	clr.w	(a0)
	rts
*
Q_put:
	clr.l	d1
	move.b	1(a0),d1
	cmp.b	#14,d1
	bcc	Q_put_9

	move.b	d0,2(a0,d1)
	addq.b	#1,1(a0)
	clr.b	d0
	rts
Q_put_9:
	move.b	#1,d0
	rts
*
Q_get:
	clr.l	d0
	clr.l	d1
	move.b	0(a0),d1
	cmp.b	1(a1),d1
	beq	Q_get_8

	move.b	2(a0,d1),d0
	addq.b	#1,d1
	move.b	d1,0(a0)
	cmp.b	1(a0),d1
	beq	Q_get_9

	clr.b	d1
	rts
Q_get_8:
	move.b	#2,d1
	rts
Q_get_9:
	move.b	#1,d1
	rts
*
y_wy:
	clr.l	d0
	clr.l	d1

	move.w	2(a3),d1
	move.w	4(a3),d0
	cmp.w	d1,d0		;if y>=wy then
	bls	y_wy_0		;  then y_wy_0

	move.w	#64,d2		;*d2=64-wy+y
	sub.w	d0,d2
	add.w	d1,d2
	rts
y_wy_0:
	move.w	d1,d2		;d2=y-wy
	sub.w	d0,d2
	rts

cursor:
	bsr	y_wy
	move.w	0(a3),d1
	move.l	#$23,d0
	trap	#15
	rts

*
*	グラフィック画面に１文字表示するルーチン
*		    SYM2
*		by CHACK'N
*	SYM2(address,character,palet)
*
*	0.244+用 組み込み修正 by シュガー
*
SYM2:
		movem.l d1-d5/a0-a3,-(sp)
		move.w	10(a3),d5
		move.l	d2,-(sp)
		moveq.l	#$16,d0
		moveq.l	#8,d2
		trap	#15
		move.l	d0,a0
		addq.w	#1,d1
		lsl.w	#3,d1
		move.l	(sp)+,d2
		move.w	d1,d4
		subq.w	#1,d4
		cmp.w	#7,d4
		beq	ANK_2
		
		bsr	super_on
		move.w	#15,d1
SYMDR_LP0:
		move.w	(a0)+,d0
		move.w	d4,d3
SYMDR_LP1:
				lsl.w	#1,d0
				bcc	NO_DOT
				move.w	d2,(a1)+
				bra	S_LP1_L
	NO_DOT:
			move.w	d5,(a1)+
	S_LP1_L:dbra	d3,SYMDR_LP1
		add.l	#(1024-16)*2,a1
		dbra	d1,SYMDR_LP0
		bsr	super_off
		movem.l	(sp)+,d1-d5/a0-a3
		rts
*
ANK_2:
		bsr	super_on
		move.w	#15,d1
ANKDR_LP0:
			move.b	(a0)+,d0
			move.w	d4,d3
	ANKDR_LP1:
				lsl.b	#1,d0
				bcc	NO_ANK
				move.w	d2,(a1)+
				bra	A_LP1_L
	NO_ANK:
			move.w	d5,(a1)+
	A_LP1_L:dbra	d3,ANKDR_LP1
		add.l	#(1024-8)*2,a1
		dbra	d1,ANKDR_LP0
		bsr	super_off
		movem.l	(sp)+,d1-d5/a0-a3
		rts

*///////////////////////////////////////////////
*
*		GpOut data area
*
*///////////////////////////////////////////////
	.data
	.even

cur_x:	dc.w		0		;+0  cursor x
	dc.w		0		;+2  cursor y
	dc.w		0		;+4  window top y
	dc.b		0		;+6  esc sequence no.
	dc.b		0		;+7  esc= l save.
	dc.w		15		;+8  character color code.
	dc.w		0		;+10 backgraund color code.
	dc.w		0		;+12 esc[s flag (0=disable  0<> enable)
	dc.w		0		;+14       copy cur_x
	dc.w		0		;+16       copy y-wy
	dc.w		0		;+18       copy chr color
	dc.w		0		;+20       copy back color
	dc.w		0		;+22 shift jis 1byte char.
	dc.b		0		;+24 under line flag (not 0 then under line)
*
	.even
symbol_par:
	dc.w		0		;symbol TRAP parm table
	dc.w		0
	dc.l		chr_buf
	dc.b		1
	dc.b		1
	dc.w		15		;color code (0-15)
	dc.b		1
	dc.b		0
chr_buf:dc.l		0
	dc.l		0
*
box_par:
	dc.w		0		;box TRAP parm table
	dc.w		0
	dc.w		0
	dc.w		0
	dc.w		0
	dc.w		$ffff
*
	.even
ssp_buf:
	dc.l		0
ctl_tbl:
	dc.l		null		;00
	dc.l		null		;01
	dc.l		null		;02
	dc.l		null		;03
	dc.l		null		;04
	dc.l		null		;05
	dc.l		null		;06
	dc.l		bel		;07
	dc.l		bs		;08
	dc.l		ht		;09
	dc.l		lf		;0a
	dc.l		vt		;0b
	dc.l		ff		;0c
	dc.l		cr		;0d
	dc.l		null		;0e
	dc.l		null		;0f
	dc.l		null		;10
	dc.l		null		;11
	dc.l		null		;12
	dc.l		null		;13
	dc.l		null		;14
	dc.l		null		;15
	dc.l		null		;16
	dc.l		null		;17
	dc.l		null		;18
	dc.l		null		;19
	dc.l		sub		;1a
	dc.l		esc		;1b
	dc.l		null		;1c
	dc.l		null		;1d
	dc.l		rs		;1e
	dc.l		null		;1f
	dc.l		bs		;20 (code=$7f)
*		
seq_vect:
	dc.l		esc_1		;sequence no. jump vecter
	dc.l		esc_2
	dc.l		esc_3
	dc.l		esc_4
	dc.l		esc_5
	dc.l		esc_6
*
esc4_chr:
	dc.l		15		; number of esc[ parameter
	dc.b		'usmfMLKJHDCBA>;'

	.even
esc4_vect:
	dc.l		e4_coron	;;
	dc.l		e4_e5		;>
	dc.l		e4_A		;A
	dc.l		e4_B		;B
	dc.l		e4_C		;C
	dc.l		e4_D		;D
	dc.l		e4_H		;H
	dc.l		e4_J		;J
	dc.l		e4_K		;K
	dc.l		e4_L		;L
	dc.l		e4_M		;M
	dc.l		e4_H		;f
	dc.l		e4_m		;m
	dc.l		e4_s		;s
	dc.l		e4_u		;u
*
color_tbl:
	dc.w		0		;30m	ANSI color convert table.
	dc.w		5		;31m
	dc.w		9		;32m
	dc.w		13		;33m
	dc.w		3		;34m
	dc.w		7		;35m
	dc.w		11		;36m
	dc.w		15		;37m
*
num_Q:
	dc.b		0		;Q_get point   (number stack Q)
	dc.b		0		;Q_put point
	ds.b		14		;14 slot.

bin_Q:
	dc.b		0		;(binary stack Q)
	dc.b		0
	ds.b		14
*
	.even
X_SIZE:	dc.w		80
	dc.w		79
	dc.l		$27f
	dc.l		$300
Y_SIZE:	dc.w		25
	dc.w		24
	dc.w		40
	dc.w		23
	dc.w		399

*-----------------------------------------------*
*		MAIN Data Area			*
*-----------------------------------------------*
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
*	下記のＢＢＳ局の電話番号・通信速度／ＢＢＳ局名 及び		*
*	ファンクションキー１１～２０を変更してご使用下さい		*	
*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
	.even
nphone:	dc.b	35			; 登録リスト数 max = 18

*---＜＜通信速度簡易設定＞＞----------------------------------------------------------
_pd1:	dc.w	b300non,0		; 　３００ｂｐｓ　フロー制御なし
_pd2:	dc.w	b300xon,0		; 　３００ｂｐｓ　フロー制御あり
_pd3:	dc.w	b120non,0		; １２００ｂｐｓ　フロー制御なし
_pd4:	dc.w	b120xon,0		; １２００ｂｐｓ　フロー制御あり
_pd5:	dc.w	b240xon,0		; ２４００ｂｐｓ　フロー制御あり
_pd6:	dc.w	b480xon,0		; ４８００ｂｐｓ　フロー制御あり
_pd7:	dc.w	0
	dc.b	'+++ATH',13,0		; 公衆回線接断
_pd8:	dc.w	b120xon			; アマチュア無線パケットコントローラ設定
	dc.b	03,13,17,0
_pd9:	dc.w	b120tnc,0		; TNC初期状態 1200bps,xon,7bit,1stop,偶数ﾊﾟﾘﾃｨ


_pd10:	dc.w	b120xon			    ; A SHARP BBS
	dc.b	'ATDP611-4357',0
_pd11:	dc.w	b120xon			    ; B ACS
	dc.b	'ATDP271-0842',0
_pd12:	dc.w	b120xon			    ; C PCS(1)
	dc.b	'ATDP(03)486-7987',0
_pd13:	dc.w	b120xon			    ; D PCS(2)
	dc.b	'ATDP(03)797-3401',0
_pd14:	dc.w	b120xon			    ; E EMI-NET
	dc.b	'ATDP(0568)33-5774',0
_pd15:	dc.w	b120xon			    ; F ｻﾝﾃﾞｰﾈｯﾄ
	dc.b	'ATDP(03)588-1870',0
_pd16:	dc.w	b300xon			    ; G Hu-NET
	dc.b	'ATDP231-2904',0
_pd17:	dc.w	b120xon			    ; H COCK
	dc.b	'ATDP(06)373-9961',0
_pd18:	dc.w	b120xon			    ; I I-NET
	dc.b	'ATDP(0563)57-0138',0
_pd19:	dc.w	b120xon			    ; U 南野-NET
	dc.b	'ATDP(06)692-5992',0
_pd20:	dc.w	b120xon			    ; K KUNI-NET
	dc.b	'ATDP621-0418',0
_pd21:	dc.w	b120xon			    ; L ﾚｼﾞｬｰﾏｯﾌﾟ
	dc.b	'ATDP(052)452-7012',0
_pd22:	dc.w	b120xon			    ; M MAX-BBS
	dc.b	'ATDP(03)743-0912',0
_pd23:	dc.w	b120xon			    ; N 99-NET
	dc.b	'ATDP(052)251-9314',0
_pd24:	dc.w	b300xon			    ; O ｵﾚﾝｼﾞ･ﾈｯﾄ
	dc.b	'ATDP(052)502-1408',0
_pd25:	dc.w	b120xon			    ; P PEKIN
	dc.b	'ATDP(03)447-6182',0
_pd26:	dc.w	b120xon			    ; Q PASTEL
	dc.b	'ATDP(052)832-6944',0
_pd27:	dc.w	b120xon			    ; R ﾅﾂﾒ･ﾈｯﾄ
	dc.b	'ATDP(03)291-1276',0
_pd28:	dc.w	b120xon			    ; S WNGA-NET 
	dc.b	'ATDP(0134)34-8024',0
_pd29:	dc.w	b120xon			    ; T ﾘｮｳｻﾞﾝﾊﾟｸ68NET
	dc.b	'ATDP(03)504-1977',0
_pd30:	dc.w	b120xon			    ; U B.B.S.H
	dc.b	'ATDP641-0487',0
_pd31:	dc.w	b120xon			    ; V OMC
	dc.b	'ATDP(0134)29-3716',0
_pd32:	dc.w	b120xon			    ; W 99-NET       			
	dc.b	'ATDP222-5889',0
_pd33:	dc.w	b120xon 		    ; X YES-NET
	dc.b	'ATDP222-9165',0
_pd34:	dc.w	0,0			    ; Y
*	dc.b	'ATDP(000)00-0000',0
_pd35:	dc.w	b120xon			    ; Z
_pd36:	dc.b	'ATDP(000)00-0000',0

*---＜＜要変更：ＢＢＳ局名＞＞-------------------------------------------------------------

tellist:dc.b	'┌─────────────────┬─────────────────┐',0
	dc.b	'│選択　ＢＢＳ局名           (ＩＤ) │選択　ＢＢＳ局名           (ＩＤ) │',0
	dc.b	'├─────────────────┼─────────────────┤',0
	dc.b	'│Ａ.SHARP BBS  札幌　      #79     │Ｎ.99-NET     名古屋(ﾂｸﾓ)   ; #   │',0
	dc.b	'│Ｂ.ACS        東京        acs02765│Ｏ.ｵﾚﾝｼﾞ･ﾈｯﾄ  清里                │',0
	dc.b	'│Ｃ.PCS(1)     東京        pcs02765│Ｐ.PEKIN      東京(X68K)          │',0
	dc.b	'│Ｄ.PCS(2)     東京              　│Ｑ.PASTEL     名古屋              │',0
	dc.b	'│Ｅ.EMI-NET    春日井      EMIxxxx │Ｒ.ﾅﾂﾒ･ﾈｯﾄ    東京        NAT21766│',0
	dc.b	'│Ｆ.ｻﾝﾃﾞｰ･ﾈｯﾄ  ﾊﾟｿｺﾝｻﾝﾃﾞｰ          │Ｓ.WNGA-NET   小樽                │',0
	dc.b	'│Ｇ.Hu-NET     札幌        HuX100  │Ｔ.梁山泊 68  東京                │',0
	dc.b	'│Ｈ.Cock       大阪(X68K)  COCK138 │Ｕ.B.B.S.H.   札幌        #35     │',0
	dc.b	'│Ｉ.I-NET      西尾              　│Ｖ.O.M.C      小樽                │',0
	dc.b	'│Ｊ.南野-NET   大阪   　           │Ｗ.99-NET     札幌(ﾂｸﾓ)           │',0
	dc.b	'│Ｋ.KUNI-NET   札幌        KUNI055 │Ｘ.YES-NET    札幌        YES01954│',0
	dc.b	'│Ｌ.ﾚｼﾞｬｰ･ﾏｯﾌﾟ 名古屋      MAPxxxxx│Ｙ.---------                      │',0
	dc.b	'│Ｍ.MAX-BBS    東京(X68K)  #58     │Ｚ.マニュアル操作                 │',0
	dc.b	'┝━━━━━━━━━━━┯━━━━━┷━━━━━┯━━━━━━━━━━━┥',0
	dc.b	'│　１． 300bps. non　　│　４．1200bps. xon　　│　７．回線切断　      │',0
	dc.b	'│　２． 300bps. xon　　│　５．2400bps. xon　　│　８．無線ＰＣ設定    │',0
	dc.b	'│　３．1200bps. non　　│　６．4800bps. xon　　│　９．ＮＴＣ初期状態  │',0
	dc.b	'└───────────┴───────────┴───────────┘',13,0

	.even
phtable:dc.l	_pd1,_pd2,_pd3,_pd4	; ポインター
	dc.l	_pd5,_pd6,_pd7,_pd8
	dc.l	_pd9,_pd10,_pd11,_pd12
	dc.l	_pd13,_pd14,_pd15,_pd16
	dc.l	_pd17,_pd18,_pd19,_pd20
	dc.l	_pd21,_pd22,_pd23,_pd24
	dc.l	_pd25,_pd26,_pd27,_pd28
	dc.l	_pd29,_pd30,_pd31,_pd32
	dc.l	_pd33,_pd34,_pd35,0

*-------------------------------------------------------*
*	ファンクションキー・データ格納＆設定用		*
*-------------------------------------------------------*
funcbuf:ds.b	712
*
setfunc:
func1:	dc.b	$FE,'画  面',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func2:	dc.b	$FE,'記  録',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func3:	dc.b	$FE,'接  続',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func4:	dc.b	$FE,'転  送',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func5:	dc.b	$FE,'終  了',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func6:	dc.b	$FE,'比転送',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func7:	dc.b	$FE,'Ｘ記録',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func8:	dc.b	$FE,'Ｘ転送',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func9:	dc.b	$FE,'Ｂ信号',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func10:	dc.b	$FE,'Ｏ  Ｓ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

*	ここで、３２文字のテキストを指定することで、Ｆ１１－Ｆ２０に文字列が
*	設定されます。
*	必ず１つにつき半角３２文字分で１０ケ指定します。終了や不用部はＮＵＬＬにします。
*	パスワードなどを指定しておくと便利です。
*
func11:	dc.b	$FE,'Ｉ　Ｄ ','acs02765',13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func12:	dc.b	$FE,'ﾊﾟｽﾜｰﾄﾞ','X0409',13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func13:	dc.b	$FE,'ﾊﾟｽﾜｰﾄﾞ','x0409',13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func14:	dc.b	'あうぇっど',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func15:	dc.b	'こんばんは。',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func16:	dc.b	'そうですね。',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func17:	dc.b	'ふむふむ。  ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func18:	dc.b	'お先に失礼します。',0,0,0,0,0,0,0,0,0,0,0,0,0,0
func19:	dc.b	'さようなら。',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
func20:	dc.b	'おやすみなさい。',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
*
	dc.b	14,0,0,0,0,0	; ROLL UP	; キーの割り当て
	dc.b	15,0,0,0,0,0	; ROLL DOWN
	dc.b	18,0,0,0,0,0	; INS
	dc.b	127,0,0,0,0,0	; DEL
	dc.b	30,0,0,0,0,0	; UP
	dc.b	29,0,0,0,0,0	; LEFT
	dc.b	28,0,0,0,0,0	; RIGHT
	dc.b	31,0,0,0,0,0	; DOWN
	dc.b	12,0,0,0,0,0	; CLR
	dc.b	22,0,0,0,0,0	; HELP
	dc.b	11,0,0,0,0,0	; HOME
	dc.b	21,0,0,0,0,0	; UNDO

*---------------------------------------*
*	パターン用			*
*---------------------------------------*
	.even
paint80_buf:
	dc.w	1
	dc.w	640
	dc.w	0
	dc.w	128
	dc.w	400

ｽｹｰﾙpaint_buf:
	dc.w	1
	dc.w	1
	dc.w	400
	dc.w	766
	dc.w	15
	dc.w	full_pat

funcp1_buf:
	dc.w	1
	dc.w	1
	dc.w	416
	dc.w	360
	dc.w	48
	dc.w	p1_pat

funcp2_buf:
	dc.w	1
	dc.w	373
	dc.w	416
	dc.w	358
	dc.w	48
	dc.w	p1_pat

funcp3_buf:
	dc.w	1
	dc.w	0
	dc.w	416
	dc.w	72
	dc.w	24
	dc.w	0

msgp_buf:
	dc.w	1
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	p2_pat

line_buf:
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	full_pat

mbox_buf:
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0
	dc.w	0

*---------------------------------------*
*	各種フラグ			*
*---------------------------------------*
	  .even
dflag:	  dc.w	-1		; download   時 file number
uflag:	  dc.w	-1		; upload     時 file number
xflag:	  dc.w	-1		; x protocol 時 file number
nakflag:  dc.w	-1
brktst:	  dc.w	0
brk_flag: dc.w  0
kanji_flg:dc.b	0

*---------------------------------------*
*	バッファ他			*
*---------------------------------------*
	.even
Old_NMI:ds.l	1
tmmode:	dc.w	b120xon		; 通常回線通信モード
tmxmod:	dc.w	b120non		; Ｘモデム通信モード
length:	dc.l	0
count:	dc.l	0
blockn:	dc.b	0		; ブロック番号
blockm:	dc.b	0
buffer:	ds.b	150
check:	ds.b	200

	.even
ncheck:	dc.l	0
retrans:dc.l	0
data:	dc.w	0		; データの格納場所
w_data:	dc.w	0
chkch:	dc.b	0,0
erach:	dc.b	24,0		; ^X　行取り消しコード
tpack:	dc.b	'*',0		; ACK
tpnak:	dc.b	'?',0		; NAK
norsp:	dc.b	'-',0		; NO RESPONS
FNCsns1:dc.b	0
FNCsns2:dc.b	0

result:	ds.b	20
gtelbuf:dc.b	15,0
itelno:	ds.b	16
itoabuf:ds.b	4
	dc.b	' 回トライ',0

cntrst: dc.b	0
comstr:	dc.b	70,0
entstr:	ds.b	90
p1_buf:	dcb.b	256,0
f1_buf:	ds.b	90
cmdtext:dc.b	'command /B:4 /C ',0

ufname:	dc.b	30,0
ufid:	ds.b	31
dfname:	dc.b	30,0
dfid:	ds.b	31
xfname:	dc.b	30,0
xfid:	ds.b	31

	.even
exp_tbl:
*	dc.w	10000
	dc.w	1000
	dc.w	100
	dc.w	10
	dc.w	1

befor_t:dc.w	0
time_data:
HH:	dc.b	0
	dc.b	0
	dc.b	0	
MM:	dc.b	0
	dc.b	0
	dc.b	0
SS:	dc.b	0
	dc.b	0,0

	.even
kanji_buf:dc.w	0
kpatdata: ds.w	1
	  ds.w	1
	  ds.b	32

*---------------------------------------*
*	ESCシーケンス、CTRLコード	*
*---------------------------------------*
esc_0m:	  dc.b	ESC,'[m',0
cur_on:   dc.b	ESC,'[>5l',0
cls:	  dc.b	ESC,'*',0
crlf:	  dc.b	CR,LF,0

*---------------------------------------*
*	Opening､endingメッセージ	*
*---------------------------------------*
wupmsg:	 dc.b	7,27,'[42mＡＢＴ版',27,'[44mターミナルソフト',27,'[36m  '
	 dc.b	27,'[32m�氓U８０００',27,'[m',10,13,0
ending:	 dc.b	'お疲れさまでした',0
gram_msg:dc.b	'ＡＢＴｅｒｍ　Ver. 0.245+では、グラフィック画面を使用します。',10,13
	 dc.b	'ＲＡＭディスクの内容を破壊しても宜しいですか？（Ｙes or Ｎo）：',0
end_msg: dc.b	7,27,'[32m実行を中止します。',27,'[m',10,13,0

*---------------------------------------*
*	初期画面表示用			*
*---------------------------------------*
Ver_msg: dc.b	'ABTerm Ver0.245+',0
ｽｹｰﾙ:	 dc.b	'････*････�1････*････�2････*････�3････*････�4'
	 dc.b	'････*････�5････*････�6････*････�7････*････�8'
	 dc.b	'････*････�9････*･',0
fnc_1:	 dc.b	'�1',0
fnc_2:	 dc.b	'�2',0	
mes_msg: dc.b	'メッセージ: ',0
mode_msg:dc.b	'モ　ー　ド: ',0
size_msg:dc.b	'画面サイズ: ',0
x80_msg: dc.b	'８０桁×２５行',0
x96_msg: dc.b	'９６桁×２５行',0
time_msg:dc.b	'時　刻:',0

*---------------------------------------*
*	エラーメッセージ		*
*---------------------------------------*
mdofmsg: dc.b	'モデムの電源ＯＮ、回線コードの接続、通信速度等をチェックして下さい',0
limtmsg: dc.b	'接続出来ませんでした。処理を中止します',0
doscErr: dc.b	'コマンドが見付かりませんでした',0
dwnovr:	 dc.b	'そのファイルは既に存在しています',0
dwnerr:	 dc.b	'指定ファイルの作成に失敗しました',0
uplerr:	 dc.b	'ファイルのオープン又はリードエラーです',0
dsk_err: dc.b	'ディスク書き込みエラー。処理を中止します',0
cls_err: dc.b	'ファイルのクローズに失敗しました',0
up_err:  dc.b	'ファイルの転送に失敗しました',0

*---------------------------------------*
*	その他表示文字列		*
*---------------------------------------*
telmode: dc.b	'通信速度選択(１－６) : ',0
tel_no:	 dc.b	'電話番号入力 : ',0
retmsg:	 dc.b	27,'[32mターミナルモードに戻ります！ 何かキーを押して下さい。',27,'[m',0
cnctmsg: dc.b	'接続しました',0
busymsg: dc.b	'話中です',0
telcutmsg: dc.b	'回線を強制切断しました',0
del_line:dc.b	' ',0
ind_mode:dc.b	'ATX4',13,0

*hlpmsg: dc.b	10,13,'+-------------------------------------------------------+'
*	 dc.b	10,13,'|　８bit １parity に固定 (TNCを除く) 全二重のみ		|'
*	 dc.b	10,13,'|　Ｓhift JIS漢字のみ	行取り消しは＾Ｘを使用		|'
*	 dc.b	10,13,'|　UPLOADは比転送を推奨…チェック及び再送を実施		|'
*	 dc.b	10,13,'|　ＰＤＳ（無断複写及び使用許可）但し一時凌ぎ的位置付け	|'
*	 dc.b	10,13,'+-------------------------------------------------------+'
*	 dc.b	10,13,0

termret: dc.b	'ターミナル',0
xcremsg: dc.b	'Ｘmodem プロトコル '
logmsg:	 dc.b	'ダウンロード中',0
xopnmsg: dc.b	'Ｘmodem プロトコル '
upl_msg: dc.b	'アップロード中',0
cntmod_msg:dc.b	'接　続',0

clsmsg:
xclsmsg: dc.b	'終了 - ',0

dwnmsg:	 dc.b	'記録ファイル名＞',0
uplmsg:	 dc.b	'転送ファイル名＞',0

cuplmsg: dc.b	'比較転送ファイル名＞',0
cupl_msg:dc.b	'比較アップロード中',0

xdwnmsg: dc.b	'Ｘmodem 作成ファイル名＞',0
xupmsg:	 dc.b	'Ｘmodem 転送ファイル名＞',0

entcom:	 dc.b	'Human68k >',0

slctmsg: dc.b	'選択枝入力＞',0

brkmsg:	 dc.b	'ブレイク信号を送出しました',0
esc_exit:dc.b	'作業を中止しました',0


	.text
	.even
*-------------------------------*
*	ＰＲＯＣＥＤＵＲＥ群	*
*-------------------------------*

super_on:equ	 *			; スーパーバイザーモードＯｎ	
	clr.l	 -(sp)
	dc.w	 _super
	addq.l	 #4,sp
	move.l	 d0,ssp_buf
	rts
*
super_off:equ	 *			; スーパーバイザーモードＯｆｆ
	move.l	 ssp_buf(pc),-(sp)
	dc.w	 _super
	addq.l	 #4,sp
	rts
*
xup_packet:
	move.l	 d2,-(sp)
	move.b	 #SOH,d0		; パケット・ヘッダの送信
	bsr	 putcom
	move.b	 blockn,d0		; ブロック番号の送信
	bsr	 putcom
	move.b	 blockm,d0		; 反転ブロック番号の送信
	bsr	 putcom
	clr.w	 d2			; チェック・サム・カウンタ
	clr.w	 count
_xp1:	cmp.w	 #LPACKET,count
	bge	 _xp2
	bsr	 bgetch
	add.b	 d0,d2			; チェック・サムに１バイトずつ加算
	bsr	 putcom			; ファイルから１バイト出力
	addq.w	 #1,count
	bra	 _xp1
_xp2:	move.b	 d2,d0
	bsr	 putcom			; チェック・サム出力
	clr.w	 count
	move.l	 (sp)+,d2
	rts
*
xread:	fread	 xflag,#LPACKET,buffer	; １文字ファイルから読み込む
	tst.w	 d0
	beq	 _qxread
	lea	 buffer,a0
_xrd1:	cmp.w	 #LPACKET,d0
	bge	 _qxread
	move.b	 #$1A,(a0,d0)
	addq.l	 #1,d0
	bra	 _xrd1
_qxread:rts
*
xwrite:	fwrite	 xflag,#LPACKET,buffer	; ファイルに１文字書き出す
	rts
*
fputch:	fwrite	 dflag,#1,w_data	; ファイルに１文字書き出す
	rts
*
fgetch:	fread	 uflag,#1,data		; １文字ファイルから読み込む
	rts
*
auxin:	bsr	 getcomw		; 回線より文字入力
	tst	 nakflag
	beq	 _qain			; タイムオーバー？
	move.w	 #NAK,d0
	bsr	 putcom			; 再送要求
_aux1:	gprint	 norsp			; 返答なし
	clr.l	 d0
_qain:	rts
*
auxin2: bsr	 getcomw		; 回線より文字入力 Xmodem ｱｯﾌﾟﾛｰﾄﾞで使用
	tst	 nakflag
	bne	 _aux1			; 返答なし
	rts
*
bgetch:	lea	 buffer,a0		; 溜めたバッファより文字の入力
	move.w	 count,d1
	move.b	 (a0,d1),d0
	rts
*
bpsset:	move	 tmmode,d0		; 回線モードの設定
	bsr	 setcom
	rts
*
xbpsset:move	 tmxmod,d0		; Ｘモデムモードの設定
	bsr	 setcom
	rts
*
commode:move.l	 #-1,d0
	bsr	 setcom			; 現在のモードを調べる
setmode:
	move.w	 d0,tmmode		; 通常の回線モードの設定
	and.w	 #$fd0f,d0
	move.w	 d0,tmxmod		; Ｘmodem　プロトコル時の回線モードの設定
	rts
*
fgline: lea	 buffer,a0		; １行入力
_fgs1:	bsr	 fgetch			; ファイルから１文字入力
	tst	 d0
	bne	 _fgs2			; ファイル終了？
	move.b	 #EOF,(a0)+		; ＥＯＦを設定しておしまい。
	bra	 _qfgs
_fgs2:	cmp.b	 #LF,data		; ＬＦなら読み飛ばし
	beq	 _fgs1
	move.b	 data,(a0)+		; データをセット
	cmp.b	 #EOF,data		; それがＥＯＦならおしまい。
	beq	 _qfgs
	cmp.b	 #CR,data		; ＣＲなら行の終了
	beq	 _qfgs
	bra	 _fgs1			; 次の文字へ
_qfgs:	rts
*
chkuget:bsr	 lofcom			; 回線から文字が送られた？
	tst	 d0
	beq	 _qckug			; 送られてなければ終了
	bsr	 getcom			; 回線から１文字取り込む
	bsr	 gout			; putch
	bra	 chkuget		; 再度チェック
_qckug:	rts
*
dwnchk:	move	 d0,-(sp)		; ダウンロードが設定されていれば
	tst.w	 dflag			; ファイルへ書き出す
	bmi	 _qdwnc
	tst.b	 d0
	beq	 _qdwnc			; NULL文字は書き出さない
	move.b	 d0,w_data
	fwrite	 dflag,#1,w_data 	; ファイルへ１文字出力
	cmp.l	 #1,d0
	beq	 _qdwnc0
	bsr	 beep_on
	b_putmes #1,#26,#31,#39,dsk_err
	bsr	 timing2
	b_putmes #1,#24,#31,#6,clsmsg
	b_putmes #1,#31,#31,#53,dfid
	bsr	 timing2
	move.b	 #EOF,w_data
	fwrite	 dflag,#1,w_data
	fclose	 dflag
	move.w	 #-1,dflag
_qdwnc0:clr.w	 w_data
_qdwnc:	move	 (sp)+,d0
	rts
*
getcomw:move.w	 #0,nakflag
	move.l	 #OVERTIME,-(sp) ; オーバーラン・タイムのカウンタ
_gcw1:	bsr	 lofcom
	tst	 d0
	bne	 _qgcw
	subq.l	 #1,(sp)
	tst.l	 (sp)
	bne	 _gcw1
	move.l	 (sp)+,d0	; タイム・オーバー
	move.w	 #1,nakflag
	rts
*
brkchk: clr.w	 brktst		; ブレイクチェック
	bsr	 keyin
	cmp	 #ESC,d0	; ＥＳＣで作業中止
	bne	 _qbrk
	addq.w	 #1,brktst
_qbrk:	rts
_qgcw:	addq.l	 #4,sp
	bsr	 getcom		; 回線より１文字入力
	rts
*
lofcom:	moveq.l	 #$31,d0	; 回線バッファに残っている文字数
	trap	 #$0f		; を調べる
	rts
*
getch:	move.w	 d1,-(sp)
	clr.b	 FNCsns1
	clr.b	 FNCsns2
	moveq.l	 #$0E,d1	; SHIFT & CTRL & OPTn ならﾌｧﾝｸｼｮﾝ･ｷｰは非チェック
	moveq.l	 #4,d0
	trap	 #15
	and.b	 #$0F,d0
	bne	 _qget1
	moveq.l	 #$0C,d1	; F1-F5 が押されているか？
	moveq.l	 #4,d0
	trap	 #15
	and.b	 #$F8,d0
	move.b	 d0,FNCsns1
	moveq.l	 #$0D,d1	; F6-F10 が押されているか？
	moveq.l	 #4,d0
	trap	 #15
	and.b	 #$1F,d0
	move.b	 d0,FNCsns2
_qget1:	move.w	 (sp)+,d1
	tst.b	 FNCsns1	; センス状況の把握
	bne	 cmdent
	tst.b	 FNCsns2
	beq	 _qnotcmd
cmdent:	bsr	 command	; コマンドモードへ
_qnotcmd:
	bsr	 keyin		; キースキャン
_qgc	rts
*
keyin:	move.w	 #$ff,-(sp)	; リアルタイム・キースキャン
	dc.w	 _inpout
	addq.l	 #2,sp
	rts
*
keyinw:	bsr	 keyin		; １文字入力
	tst	 d0
	beq	 keyinw		; 文字が入力されるまで待つ
	rts
*
putch:	move.w	 d0,-(sp)	; １文字出力
	move.w	 d0,-(sp)
	dc.w	 _inpout
	addq.l	 #2,sp
	move.w	 (sp)+,d0
	rts
*
setcom:	move	 d1,-(sp)	; 回線のモードを設定する
	move.w	 d0,d1
	moveq.l	 #$30,d0
	trap	 #$0f
	move	 (sp)+,d1
	rts
*
getcom:	moveq.l	 #$32,d0	; 回線より１文字受け取る
	trap	 #$0f
	bsr	 dwnchk
	rts
*
putcom:	move	 d1,-(sp)	; 回線に１文字送る
	move	 d0,d1
	moveq.l	 #$35,d0
	trap	 #$0f
	move	 (sp)+,d1
	rts
*
memfree:move.l	 a0,-(sp)
	move.l	 a1,-(sp)
	adda.l	 #$10,a0	; a0:memptr
	suba.l	 a0,a1		; a1:datalen
	movem.l	 a0-a1,-(sp)
	dc.w	 _setblock
	addq.l	 #8,sp
	move.l	 (sp)+,a1
	move.l	 (sp)+,a0
	rts
*
exec_2:	clr.l	 -(SP)		; P2:0
	pea	 (A1)		; P1:(A1)
	pea	 (A0)		; FIL:(A0)
	move.w	 #2,-(SP)	; MD:2
	dc.w	 _exec		; _exec
	lea	 $0E(SP),SP
	rts
*
exec_0:	movem.l	 D1-D7/A0-A6,-(SP)
	clr.l	 -(SP)		; P2:0
	pea	 (A1)		; P1:(A1)
	pea	 (A0)		; FIL:(A0)
	clr.w	 -(SP)		; MD:0
	dc.w	 _exec		; _exec
	lea	 $0E(SP),SP
	movem.l	 (SP)+,D1-D7/A0-A6
	rts
*
result_r:equ	 *
	move.w	 d7,-(sp)
	move.w	 #2,d7
_rt_r1:	bsr	 lofcom
	tst.w	 d0
	beq	 _rt_r1
	bsr	 getcom
	cmp.b	 #LF,d0
	bne	 _rt_r1
	subq.w	 #1,d7
	bne	 _rt_r1
	move.w	 (sp)+,d7
	rts
*
beep_on:equ	 *
	move.l	 d0,-(sp)
	move.w	 #BL,-(sp)
	dc.w	 _inpout
	addq.l	 #2,sp
	move.l	 (sp)+,d0
	rts
*
msg_clr:equ	 *
	b_putmes #0,#12,#31,#82,del_line
	rts
*
consol31:equ	 *
	b_consol #TX_TY,#$005f001e
	rts
*
consol25:equ	 *
	b_consol #TX_TY,#COL_LINE
	rts
*
disp_menu:equ	 *
	movem.l	 d1-d4,-(sp)
	subq.w	 #1,d4
	addq.w	 #1,d1
dpm_lop:addq.w	 #1,d2
	moveq.l	 #$23,d0
	trap	 #15
	moveq.l	 #$21,d0
	trap	 #15
	dbra	 d4,dpm_lop
	movem.l	 (sp)+,d1-d4

	lea	 mbox_buf,a1
	lsl.w	 #3,d1
	lsl.w	 #4,d2
	addq.w	 #8,d2
	lsl.w	 #3,d3
	add.w	 #15,d3
	lsl.w	 #4,d4
	add.w	 #15,d4
	move.w	 #1,0(a1)
	move.w	 d1,2(a1)
	move.w	 d2,4(a1)
	move.w	 d3,6(a1)
	move.w	 d4,8(a1)
	move.w	 #full_pat,10(a1)
	moveq.l	 #$d7,d0
	trap	 #15
	rts
*
cls_menu:equ	 *
	movem.l	 d0/a1,-(sp)
	lea	 mbox_buf,a1
	move.w	 #1,0(a1)
	move.w	 #clr_pat,10(a1)
	moveq.l	 #$d7,d0
	trap	 #15
	clr.w	 0(a1)
	moveq.l	 #$d7,d0
	trap	 #15
	movem.l	 (sp)+,d0/a1
	rts
*
t_putmes:equ	 *
	movem.l	 d0-d7/a0-d6,-(sp)
tpm1:	clr.l	 d0
	move.b	 (a0)+,d0
	bsr	 sjis_chk
	cmp.w	 #-1,d0
	bne	 tpm2
	subq.w	 #1,d3
	cmp.w	 #1,d3
	bge	 tpm1
	clr.w	 d0
tpm2:	tst.w	 d0
	beq	 tpm_exit
	fntget	 d0,kpatdata
	textput	 kpatdata
	add.w	 kpatdata,d1
	subq.w	 #1,d3
	cmp.w	 #0,d3
	bhi	 tpm1
tpm_exit:
	cmp.w	 #0,d3
	ble	 tpm4
	subq.w	 #1,d3
tpm3:	moveq.l	 #$20,d0
	fntget	 d0,kpatdata
	textput	 kpatdata
	add.w	 kpatdata,d1
	dbra	 d3,tpm3	
tpm4:	movem.l	 (sp)+,d0-d7/a0-d6
	rts
*
sjis_chk:equ	 *
	cmp.w	 #0,kanji_buf
	bne	 kanji_make
	tst.b	 d0
	beq	 sj_exit
	cmp.b	 #$fe,d0
	beq	 not_chr
	cmp.b	 #$80,d0
	bcs	 ANK
	cmp.b	 #$a0,d0
	bcs	 kanji_set
	cmp.b	 #$e0,d0
	bcs	 ANK
kanji_set:
	move.b	 d0,kanji_buf
	move.w	 #-1,d0
	bra	 sj_exit
kanji_make:
	add.w	 kanji_buf,d0
	clr.w	 kanji_buf
	bra	 sj_exit
ANK:
not_chr:
sj_exit:rts
*
time_on:equ	 *
	lea	 disp_time,a1
	move.w	 #7*256+255,d1
	moveq.l	 #$6b,d0
	trap	 #15
	rts
*
time_off:equ	 *
	movea.l	 #0,a1
	moveq.l	 #$6b,d0
	trap	 #15
	rts
*
disp_time:equ	 *
	movem.l	 d0-d7/a0-a6,-(sp)
	moveq.l	 #$56,d0
	trap	 #15
	cmp.w	 befor_t,d0
	beq	 dpt_end
	move.w	 d0,befor_t
	move.l	 d0,d1
	moveq.l	 #$57,d0
	trap	 #15
	move.l	 d0,d1
	lea	 time_data,a1
	moveq.l	 #$5b,d0
	trap	 #15
	b_putmes #1,#34,#29,#7,time_data
dpt_end:movem.l  (sp)+,d0-d7/a0-a6
	rte
*
NMI:	equ	*
	movem.l	d0-d7/a0-a6,-(sp)
	move.w	#7,-(sp)
	dc.w	_inpout
	addq.l	#2,sp
	move.w	#-1,d1
	moveq.l	#$30,d0
	trap	#15
	move.w	d0,d1
	moveq.l	#$30,d0
	trap	#15
	bset.b	#2,NMI_RESET
	movem.l	(sp)+,d0-d7/a0-a6
	rte
*	
pr:	equ	 *
	clr.l	 d0
	move.b	 (a1)+,d0
	tst.b	 d0
	beq	 pr1
	bsr	 gout
	bra	 pr
pr1:	rts
*
init1:	equ	 *
	crtmod	 #$10
	b_clr_st #2
	bsr	 consol25
	g_clr_on
	window	 #GX1,#GY1,#GX2,#GY2
	apage	 #0
	vpage	 #1
	rts
*
init2:	equ	 *
	tpalet2
	b_putmes #1,#0,#25,#95,ｽｹｰﾙ
	b_putmes #3,#0,#29,#11,size_msg
	b_putmes #3,#0,#30,#11,mode_msg
	b_putmes #3,#0,#31,#11,mes_msg
	lea	 x80_msg,a0
	cmp.w	 #96,X_SIZE
	bne	 skip_i2
	lea	 x96_msg,a0
skip_i2:b_putmes #1,#12,#29,#13,(a0)
	b_putmes #3,#27,#29,#6,time_msg
	b_putmes #3,#80,#29,#15,Ver_msg
	b_putmes #1,#12,#30,#83,termret
	rts
*
init2_1:equ	 *
	moveq.l	 #1,d6
	moveq.l	 #4,d1
	move.w	 #420,d2
	moveq.l	 #8,d3
disp_f1:moveq.l	 #5-1,d5
disp_f2:
	bsr	 t_putmes
	addi.w	 #72,d1
	adda.l	 #32,a0
	dbra	 d5,disp_f2
	addi.w	 #12,d1
	dbra	 d6,disp_f1
	moveq.l	 #1,d6
	moveq.l	 #4,d1
	move.w	 #444,d2
	moveq.l	 #8,d3
disp_f3:moveq.l	 #5-1,d5
disp_f4:bsr	 t_putmes
	addi.w	 #72,d1
	adda.l	 #32,a0
	dbra	 d5,disp_f4
	addi.w	 #12,d1
	dbra	 d6,disp_f3

	b_putmes #3,#92,#26,#4,fnc_1
	b_putmes #1,#92,#28,#4,fnc_2

	moveq.l	 #5-1,d1
	lea	 line_buf,a1
	move.w	 #72,2(a1)
	move.w	 #416,4(a1)
	move.w	 #463-416+1,6(a1)
kei_lop1:
	moveq.l	 #$d4,d0
	trap	 #15
	addi.w	 #72,2(a1)
	dbra	 d1,kei_lop1
	moveq.l	 #6-1,d1
	move.w	 #372,2(a1)
kei_lop2:
	moveq.l	 #$d4,d0
	trap	 #15
	addi.w	 #72,2(a1)
	dbra	 d1,kei_lop2
	rts
*
init3:	equ	 *
	b_boxrev paint80_buf
	rts
*
init4:	equ	 *
	b_paint	 ｽｹｰﾙpaint_buf
	b_paint	 funcp1_buf
	b_paint	 funcp2_buf
	lea	 msgp_buf,a1
	clr.w	 2(a1)
	move.w	 #464,4(a1)
	move.w	 #96,6(a1)
	move.w	 #15,8(a1)
	moveq.l	 #2,d1
msg_pt:	b_paint	 msgp_buf
	add.w	 #16,4(a1)
	dbra	 d1,msg_pt	 
	move.w	 #215,2(a1)
	move.w	 #464,4(a1)
	move.w	 #56,6(a1)
	move.w	 #16,8(a1)
	b_paint	 msgp_buf
	b_xline	 #0,#400,#767,line_buf
	b_xline	 #0,#415,#767,line_buf
	b_xline	 #0,#440,#360,line_buf
	b_xline	 #372,#440,#767,line_buf
	b_xline	 #0,#463,#767,line_buf
	b_yline	 #0,#400,#463,line_buf
	b_yline	 #767,#400,#463,line_buf
	rts
*
timing:	equ	 *
	move.l	 d0,-(sp)
	move.l	 #100000,d0
_tm_lop:subq.l	 #1,d0
	bne	 _tm_lop
	move.l	 (sp)+,d0
	rts
*
timing2:equ	 *
	move.l	 d0,-(sp)
	move.l	 #700000,d0
_tm2lop:subq.l	 #1,d0
	bne	 _tm2lop
	move.l	 (sp)+,d0
	rts
*
*delay:	equ	 *
*	movem.l	 d6-d7,-(sp)
*	moveq.l	 #2,d6
*_dly_0:move.w	 #$4cff,d7
*_dly_1:dbra	 d7,_dly_1
*	dbra	 d6,_dly_0
*	movem.l	 (sp)+,d6-d7
*	rts
*
contrast:equ	 *
	moveq.l	 #$11,d0
	trap	 #15
	rts
*
cntrst_set:equ	 *
	moveq.l	 #-2,d1
	bsr	 contrast
	moveq.l	 #-1,d1
	bsr	 contrast
	move.b	 d0,cntrst
	rts
*
b_curoff:equ	 *
	move.l	 d0,-(sp)
	moveq.l	 #$1f,d0
	trap	 #15
	move.l	 (sp)+,d0
	rts
*
b_curon:equ	 *
	move.l	 d0,-(sp)
	moveq.l	 #$1e,d0
	trap	 #15
	move.l	 (sp)+,d0
	rts
*
*fout_screen:equ *
*	clr.w	 d1
*	move.b	 cntrst,d1
*_fout1:	 move.w	d1,-(sp)
*	bsr	 contrast
*	move.w	 (sp)+,d1
*	tst.b	 d1
*	beq	 _fout3
*	subq.b	 #1,d1
*	move.w	 #CNTRT_LOOP,d2
*_fout2:
*	dbra	 d2,_fout2	
*	bra	 _fout1
*_fout3:	 rts

*fin_screen:equ	 *	
*	clr.w	 d1
*_fin1:	move.w	 d1,-(sp)
*	bsr	 contrast
*	move.w	 (sp)+,d1
*	cmp.b	 cntrst,d1
*	beq	 _fin3
*	addq.b	 #1,d1
*	move.w	 #CNTRT_LOOP,d2
*_fin2:
*	dbra	 d2,_fin2
*	bra	 _fin1
*_fin3:	rts
*	
**************************************
*
*  in:  d0=変換データ
*       A0=変換した１０進文字列格納先頭アドレス
*
**************************************

itoa:	equ	 *
	movem.l	 d1-d3/a1,-(sp)
	moveq	 #3,d1
	lea	 exp_tbl,a1
_itlop0:
	clr.b	 d2
	move.w	 (a1)+,d3
_itlop1:
	or	 d3,d3
	sub.w	 d3,d0
	bcs	 bcd_str
	addq.b	 #1,d2
	bra	 _itlop1
bcd_str:
	add.w	 d3,d0
	add.b	 #'0',d2
	move.b	 d2,(a0)+
	dbra	 d1,_itlop0
	movem.l	 (sp)+,d1-d3/a1	
	rts
*
	.end	 start	
