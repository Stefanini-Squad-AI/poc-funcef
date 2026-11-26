// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Pendência   : 1581
// Autor(a)    : Ricardo Vigorito
// Data        : 23/12/2003
// Alteração   :  inclusão dos campos  IDREGRACALCOP4,IDREGRAVALIDAOP4,
//                 IDREGRAVALIDAOP5 e IDREGRAVALIDAOP6  na query qrypatro
//
//------------------------------------------------------------------------------
//*****************************************************************************
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------
unit FCadOpcoesElegivel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask,
  MskEdDlg, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti;

type
  TFrmCadOpcoesElegivel = class(TfrmOkCancelar)
    pnlParticipante: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edNomeTit: TEdit;
    edPatroTit: TEdit;
    pnlOpcoes: TPanel;
    Label11: TLabel;
    lblNomeValorBase1: TLabel;
    lblNomeValorBase3: TLabel;
    lblNomeValorBase2: TLabel;
    edOpcao1: TcmMaskEditDlg;
    edOpcao2: TcmMaskEditDlg;
    edOpcao3: TcmMaskEditDlg;
    qryPart: TwwQuery;
    qryAux: TwwQuery;
    qrypatro: TwwQuery;
    lblNomeValorBase4: TLabel;
    lblNomeValorBase6: TLabel;
    lblNomeValorBase5: TLabel;
    edOpcao4: TcmMaskEditDlg;
    edOpcao5: TcmMaskEditDlg;
    edOpcao6: TcmMaskEditDlg;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edOpcao1BtnClick(Sender: TObject);
    procedure edOpcao2BtnClick(Sender: TObject);
    procedure edOpcao3BtnClick(Sender: TObject);
    procedure edOpcao1Exit(Sender: TObject);
    procedure edOpcao2Exit(Sender: TObject);
    procedure edOpcao3Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edOpcao4BtnClick(Sender: TObject);
    procedure edOpcao4Exit(Sender: TObject);
    procedure edOpcao5BtnClick(Sender: TObject);
    procedure edOpcao5Exit(Sender: TObject);
    procedure edOpcao6BtnClick(Sender: TObject);
    procedure edOpcao6Exit(Sender: TObject);
  private
    { Private declarations }
    rlOpcao1,rlOpcao2,rlOpcao3,rlOpcao4,rlOpcao5,rlOpcao6 : real;
    slDataEvento, slDataInicio : string;
    ilIdPessJur,  ilIdPessoa : longint;
  public
    function LerOpcoes(sNomeTit,sNomePatro,
                       sNomeValorBase1, sNomeValorBase2, sNomeValorBase3,
                       sNomeValorBase4, sNomeValorBase5, sNomeValorBase6 : string;
                       iNumOpcoes : integer;
                       var rOpcao1, rOpcao2, rOpcao3, rOpcao4, rOpcao5, rOpcao6 : real;
                       bEnabled : boolean;
                       iEditaOp1, iEditaOp2, iEditaOp3,
                       iEditaOp4, iEditaOp5, iEditaOp6 : integer;
                       piIdPessJur, piIdPessoa  : longint;
                       psDataEvento, psDataInicio : string) : boolean;
     function CalculaOpcao(piIdRegraCalculo : longint; sTitulo : string) : double;
    { Public declarations }
  end;

var
  FrmCadOpcoesElegivel: TFrmCadOpcoesElegivel;

implementation

uses fAguarde, UAdmPrev, UMensErro, FCadDepenBenef;

function TFrmCadOpcoesElegivel.CalculaOpcao(piIdRegraCalculo : longint; sTitulo : string) : double;
var sSQL, sOpcao : string;
    rOpcao1, rOpcao2, rOpcao3, rOpcao4, rOpcao5, rOpcao6 : double;
    bErro  : boolean;
    sMsgErro : string;
    j : Integer;
begin
  inherited;
  if not qrypatro.Active
  then begin
   qrypatro.Close;
   qrypatro.ParamByName('idpessoa').AsInteger := ilIdPessJur;
   qrypatro.Open;
  end;

  Result := 0;
  // Executar regra de calculo da opcao
  if Trim(edOpcao1.Text) = ''
  then rOpcao1 := 0
  else rOpcao1 := StrToFloat(edOpcao1.Text);

  if Trim(edOpcao2.Text) = ''
  then rOpcao2 := 0
  else rOpcao2 := StrToFloat(edOpcao2.Text);

  if Trim(edOpcao3.Text) = ''
  then rOpcao3 := 0
  else rOpcao3 := StrToFloat(edOpcao3.Text);

  if Trim(edOpcao4.Text) = ''
  then rOpcao4 := 0
  else rOpcao4 := StrToFloat(edOpcao4.Text);

  if Trim(edOpcao5.Text) = ''
  then rOpcao5 := 0
  else rOpcao5 := StrToFloat(edOpcao5.Text);

  if Trim(edOpcao6.Text) = ''
  then rOpcao6 := 0
  else rOpcao6 := StrToFloat(edOpcao6.Text);


  if sTitulo = 'Opção 1'
  then
    sOpcao := edOpcao1.Text
  else if sTitulo = 'Opção 2'
  then
    sOpcao := edOpcao2.Text
  else if sTitulo = 'Opção 3'
  then
    sOpcao := edOpcao3.Text
  else if sTitulo = 'Opção 4'
  then
    sOpcao := edOpcao4.Text
  else if sTitulo = 'Opção 5'
  then
    sOpcao := edOpcao5.Text
  else if sTitulo = 'Opção 6'
  then
    sOpcao := edOpcao6.Text;



  frmAguarde.Mostra('Regra de Cálculo da '+sTitulo+' da Patrocinadora - Nº '+IntToStr(piIdRegraCalculo));
  qryPart.Close;
  qryPart.ParamByName('IdPessoa').Value    := ilIdPessoa;
  qryPart.ParamByName('IdPessJur').Value   := ilIdPessJur;
  qryPart.Open;
  try

     sSQL :=  '  SELECT '+sOpcao+' AS VALORBASE , '+
              IntToSTr(ilIdPessjur)+' AS IDPESSJUR '+
              ' FROM DUAL ';

     sOpcao := RegraNumerica(inttostr(piIdRegraCalculo),sSQL,bErro,j);

     if bErro
     then begin
       MsgDlg('Ocorreu um erro na Regra de Cálculo da Opção : '+lblNomeValorBase1.Caption+'','Erro',mtError,[mbOk],0);
       edOpcao1.Text := '';
     end;

  except
     frmAguarde.Apaga;
  end;
  qryPart.Close;
  qryAux.Close;
  frmAguarde.Apaga;
  if bErro
  then begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    TiraSQL(qryAux);
    Exit;
  end
  else Result := strtofloat(sOpcao);
end;

function TFrmCadOpcoesElegivel.LerOpcoes(sNomeTit,sNomePatro,
                                      sNomeValorBase1, sNomeValorBase2, sNomeValorBase3,
                                      sNomeValorBase4, sNomeValorBase5, sNomeValorBase6 : string;
                                      iNumOpcoes : integer;
                                      var rOpcao1, rOpcao2, rOpcao3, rOpcao4, rOpcao5, rOpcao6 : real;
                                      bEnabled : boolean;
                                      iEditaOp1, iEditaOp2, iEditaOp3, iEditaOp4, iEditaOp5, iEditaOp6 : integer;
                                      piIdPessJur,  piIdPessoa : longint;
                                      psDataEvento, psDataInicio : string) : boolean;
begin
   edNomeTit.Text   := sNomeTit;
   edPatroTit.Text  := sNomePatro;

   slDataEvento  := psDataEvento;
   slDataInicio  := psDataInicio;
   ilIdPessJur   := piIdPessJur;
   ilIdPessoa    := piIdPessoa;


   rlOpcao1 := 0;
   rlOpcao2 := 0;
   rlOpcao3 := 0;
   rlOpcao4 := 0;
   rlOpcao5 := 0;
   rlOpcao6 := 0;

   if Trim(sNomeValorBase1) <> ''
   then lblNomeValorBase1.Caption := sNomeValorBase1
   else lblNomeValorBase1.Caption := 'Opção 1';

   if Trim(sNomeValorBase2) <> ''
   then lblNomeValorBase2.Caption := sNomeValorBase2
   else lblNomeValorBase2.Caption := 'Opção 2';

   if Trim(sNomeValorBase3) <> ''
   then lblNomeValorBase3.Caption := sNomeValorBase3
   else lblNomeValorBase3.Caption := 'Opção 3';

   if Trim(sNomeValorBase4) <> ''
   then lblNomeValorBase4.Caption := sNomeValorBase4
   else lblNomeValorBase4.Caption := 'Opção 4';

   if Trim(sNomeValorBase5) <> ''
   then lblNomeValorBase5.Caption := sNomeValorBase5
   else lblNomeValorBase5.Caption := 'Opção 5';

   if Trim(sNomeValorBase6) <> ''
   then lblNomeValorBase6.Caption := sNomeValorBase6
   else lblNomeValorBase6.Caption := 'Opção 6';

   lblNomeValorBase1.Visible := (iNumOpcoes >= 1);
   lblNomeValorBase2.Visible := (iNumOpcoes >= 2);
   lblNomeValorBase3.Visible := (iNumOpcoes >= 3);
   lblNomeValorBase4.Visible := (iNumOpcoes >= 4);
   lblNomeValorBase5.Visible := (iNumOpcoes >= 5);
   lblNomeValorBase6.Visible := (iNumOpcoes >= 6);

   edOpcao1.Visible := (iNumOpcoes >= 1);
   edOpcao2.Visible := (iNumOpcoes >= 2);
   edOpcao3.Visible := (iNumOpcoes >= 3);
   edOpcao4.Visible := (iNumOpcoes >= 4);
   edOpcao5.Visible := (iNumOpcoes >= 5);
   edOpcao6.Visible := (iNumOpcoes >= 6);

   edOpcao1.Text    := FormatFloat('#0.00000',rOpcao1); 
   edOpcao2.Text    := FormatFloat('#0.00000',rOpcao2); 
   edOpcao3.Text    := FormatFloat('#0.00000',rOpcao3); 
   edOpcao4.Text    := FormatFloat('#0.00000',rOpcao4); 
   edOpcao5.Text    := FormatFloat('#0.00000',rOpcao5); 
   edOpcao6.Text    := FormatFloat('#0.00000',rOpcao6); 

   edOpcao1.Enabled := (iEditaOp1 = 1);
   edOpcao2.Enabled := (iEditaOp2 = 1);
   edOpcao3.Enabled := (iEditaOp3 = 1);
   edOpcao4.Enabled := (iEditaOp4 = 1);
   edOpcao5.Enabled := (iEditaOp5 = 1);
   edOpcao6.Enabled := (iEditaOp6 = 1);
   pnlOpcoes.Enabled := bEnabled;

   qrypatro.Close;
   qrypatro.ParamByName('idpessoa').AsInteger := piIdPessjur;
   qrypatro.Open;

   ShowModal;
   if ModalResult = mrOk
   then begin
      if edOpcao2.Visible
      then rOpcao2 := StrToFloat(ClienteNumero(edOpcao2.Text))
      else rOpcao2 := 0;

      if edOpcao3.Visible
      then rOpcao3 := StrToFloat(ClienteNumero(edOpcao3.Text))
      else rOpcao3 := 0;

      if edOpcao1.Visible
      then rOpcao1 := StrToFloat(ClienteNumero(edOpcao1.Text))
      else rOpcao1 := 0;

      if edOpcao4.Visible
      then rOpcao4 := StrToFloat(ClienteNumero(edOpcao4.Text))
      else rOpcao4 := 0;

      if edOpcao5.Visible
      then rOpcao5 := StrToFloat(ClienteNumero(edOpcao5.Text))
      else rOpcao5 := 0;

      if edOpcao6.Visible
      then rOpcao6 := StrToFloat(ClienteNumero(edOpcao6.Text))
      else rOpcao6 := 0;
   end
   else begin
      rOpcao2 := -1;
      rOpcao3 := -1;
      rOpcao1 := -1;
      rOpcao4 := -1;
      rOpcao5 := -1;
      rOpcao6 := -1;
   end;
   Result := True;
end;


{$R *.DFM}

procedure TFrmCadOpcoesElegivel.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if edOpcao1.Visible and (Trim(edOpcao1.Text) = '') and
     (qrypatro.fieldbyname('FLGOBRIGAOP1').AsInteger = 1)
  then begin
     if MsgDlg('Opção 1 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
     then begin
        edOpcao1.SetFocus;
        ModalResult := mrNone;
        Abort;
     end
     else edOpcao1.Text := '0';
  end;

  if edOpcao2.Visible and (Trim(edOpcao2.Text) = '') and
     (qrypatro.fieldbyname('FLGOBRIGAOP2').AsInteger = 1)
  then begin
     if MsgDlg('Opção 2 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
     then begin
        edOpcao2.SetFocus;
        ModalResult := mrNone;
        Abort;
     end
     else edOpcao2.Text := '0';
  end;

  if edOpcao3.Visible and (Trim(edOpcao3.Text) = '') and
     (qrypatro.fieldbyname('FLGOBRIGAOP3').AsInteger = 1)
  then begin
     if MsgDlg('Opção 3 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
     then begin
        edOpcao3.SetFocus;
        ModalResult := mrNone;
        Abort;
     end
     else edOpcao3.Text := '0';
  end;

  if edOpcao4.Visible and (Trim(edOpcao4.Text) = '') and
     (qrypatro.fieldbyname('FLGOBRIGAOP4').AsInteger = 1)
  then begin
     if MsgDlg('Opção 4 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
     then begin
        edOpcao4.SetFocus;
        ModalResult := mrNone;
        Abort;
     end
     else edOpcao4.Text := '0';
  end;

  if edOpcao5.Visible and (Trim(edOpcao5.Text) = '') and
     (qrypatro.fieldbyname('FLGOBRIGAOP5').AsInteger = 1)
  then begin
     if MsgDlg('Opção 5 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
     then begin
        edOpcao5.SetFocus;
        ModalResult := mrNone;
        Abort;
     end
     else edOpcao5.Text := '0';
  end;

  if edOpcao6.Visible and (Trim(edOpcao6.Text) = '') and
     (qrypatro.fieldbyname('FLGOBRIGAOP6').AsInteger = 1)
  then begin
     if MsgDlg('Opção 6 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
     then begin
        edOpcao6.SetFocus;
        ModalResult := mrNone;
        Abort;
     end
     else edOpcao6.Text := '0';
  end;
  ModalResult := mrOk;
end;

procedure TFrmCadOpcoesElegivel.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmCadOpcoesElegivel.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmCadOpcoesElegivel.FormShow(Sender: TObject);
var
  sOpcoes : string;
begin
  inherited;
  If frmCadDepenBenef <> Nil Then
   Begin
    edOpcao1.Text := frmCadDepenBenef.qryDet.FieldByName('VALORBASE1').AsString;
    edOpcao2.Text := frmCadDepenBenef.qryDet.FieldByName('VALORBASE2').AsString;
    edOpcao3.Text := frmCadDepenBenef.qryDet.FieldByName('VALORBASE3').AsString;
    edOpcao4.Text := frmCadDepenBenef.qryDet.FieldByName('VALORBASE4').AsString;
    edOpcao5.Text := frmCadDepenBenef.qryDet.FieldByName('VALORBASE5').AsString;
    edOpcao6.Text := frmCadDepenBenef.qryDet.FieldByName('VALORBASE6').AsString;
    exit;
   End;
//
  sOpcoes := '';

  if not edOpcao1.Enabled
  then sOpcoes := lblNomeValorBase1.Caption+', ';

  if not edOpcao2.Enabled
  then sOpcoes := sOpcoes + lblNomeValorBase2.Caption+', ';

  if not edOpcao3.Enabled
  then sOpcoes := sOpcoes + lblNomeValorBase3.Caption;

  if not edOpcao4.Enabled
  then sOpcoes := sOpcoes + lblNomeValorBase4.Caption+', ';

  if not edOpcao5.Enabled
  then sOpcoes := sOpcoes + lblNomeValorBase5.Caption+', ';

  if not edOpcao6.Enabled
  then sOpcoes := sOpcoes + lblNomeValorBase6.Caption;

  if pnlOpcoes.Enabled
  then
     if ((edOpcao1.Visible) and (not edOpcao1.Enabled)) or
        ((edOpcao2.Visible) and (not edOpcao2.Enabled)) or
        ((edOpcao3.Visible) and (not edOpcao3.Enabled)) or
        ((edOpcao4.Visible) and (not edOpcao4.Enabled)) or
        ((edOpcao5.Visible) and (not edOpcao5.Enabled)) or
        ((edOpcao6.Visible) and (not edOpcao6.Enabled))
     then
        MsgDlg(sOpcoes+' não pode(m) ser alterada(s).','Atenção',mtWarning,[mbOk],0);

end;

procedure TFrmCadOpcoesElegivel.edOpcao1BtnClick(Sender: TObject);
var rOpcao : double;
begin
  inherited;
  // Executar regra de calculo da opcao
  if (qrypatro.IsEmpty) or
     (Trim(qrypatro.FieldByName('IdRegraCalcOp1').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcao(qrypatro.FieldByName('IdRegraCalcOp1').AsInteger,
                         'Opção 1');
  edOpcao1.Text  := FloatToStr(rOpcao);
end;

procedure TFrmCadOpcoesElegivel.edOpcao2BtnClick(Sender: TObject);
var rOpcao : double;
begin
  inherited;
  // Executar regra de calculo da opcao
  if (qrypatro.IsEmpty) or
     (Trim(qrypatro.FieldByName('IdRegraCalcOp2').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcao(qrypatro.FieldByName('IdRegraCalcOp2').AsInteger,
                         'Opção 2');
  edOpcao2.Text  := FloatToStr(rOpcao);
end;

procedure TFrmCadOpcoesElegivel.edOpcao3BtnClick(Sender: TObject);
var rOpcao : double;
begin
  inherited;
  // Executar regra de calculo da opcao
  if (qrypatro.IsEmpty) or
     (Trim(qrypatro.FieldByName('IdRegraCalcOp3').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcao(qrypatro.FieldByName('IdRegraCalcOp3').AsInteger,
                         'Opção 3');
  edOpcao3.Text  := FloatToStr(rOpcao);

end;

procedure TFrmCadOpcoesElegivel.edOpcao1Exit(Sender: TObject);
var sSQL, sOpcao : string;
    bErro,
    bOpcaoValida : boolean;
begin
  inherited;

  If frmCadDepenBenef <> Nil
   Then exit;

  // Executar regra de validacao da opcao
  if (qrypatro.IsEmpty) or
     (Trim(qrypatro.FieldByName('IdRegraValidaOp1').AsString) = '') or
     (Trim(edOpcao1.Text) = '')
  then Exit;

  sOpcao := OraNumero(Trim(edOpcao1.Text));
  sSQL :=  '  SELECT '+sOpcao+' AS VALORBASE , '+
                       IntToSTr(ilIdPessjur)+' AS IDPESSJUR '+
           ' FROM DUAL ';

  bOpcaoValida := RegraBooleana(qrypatro.FieldByName('IdRegraValidaOp1').AsString,
                                sSQL, bErro);

  if bErro
  then begin
    MsgDlg('Ocorreu um erro na Regra de Validação da Opção : '+lblNomeValorBase1.Caption +
           'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk],0);
    edOpcao1.Text := '';
  end
  else begin
    if not bOpcaoValida
    then begin
       MsgDlg('O valor '+edOpcao1.Text+ ' foi considerado inválido pela Regra de Validação da Opção '+lblNomeValorBase1.Caption,
              'Erro',mtError,[mbOk],0);
       edOpcao1.Text := '';
    end;
  end;

end;

procedure TFrmCadOpcoesElegivel.edOpcao2Exit(Sender: TObject);
var sSQL, sOpcao : string;
    bErro,
    bOpcaoValida : boolean;
begin
  inherited;

  If frmCadDepenBenef <> Nil
   Then exit;

  // Executar regra de validacao da opcao
  if (qrypatro.IsEmpty) or
     (Trim(qrypatro.FieldByName('IdRegraValidaOp2').AsString) = '') or
     (Trim(edOpcao2.Text) = '')
  then Exit;

  sOpcao := OraNumero(Trim(edOpcao2.Text));
  sSQL :=  '  SELECT '+sOpcao+' AS VALORBASE , '+
                       IntToSTr(ilIdPessjur)+' AS IDPESSJUR '+
           ' FROM DUAL ';

  bOpcaoValida := RegraBooleana(qrypatro.FieldByName('IdRegraValidaOp2').AsString,
                                sSQL, bErro);

  if bErro
  then begin
    MsgDlg('Ocorreu um erro na Regra de Validação da Opção : '+lblNomeValorBase2.Caption +
           'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk],0);
    edOpcao2.Text := '';
  end
  else begin
    if not bOpcaoValida
    then begin
       MsgDlg('O valor '+edOpcao2.Text+ ' foi considerado inválido pela Regra de Validação da Opção '+lblNomeValorBase2.Caption,
              'Erro',mtError,[mbOk],0);
       edOpcao2.Text := '';
    end;
  end;

end;

procedure TFrmCadOpcoesElegivel.edOpcao3Exit(Sender: TObject);
var sSQL, sOpcao : string;
    bErro,
    bOpcaoValida : boolean;
begin
  inherited;

  If frmCadDepenBenef <> Nil
   Then exit;

  // Executar regra de validacao da opcao
  if (qrypatro.IsEmpty) or
     (Trim(qrypatro.FieldByName('IdRegraValidaOp3').AsString) = '') or
     (Trim(edOpcao3.Text) = '')
  then Exit;

  sOpcao := OraNumero(Trim(edOpcao3.Text));
  sSQL :=  '  SELECT '+sOpcao+' AS VALORBASE , '+
                       IntToSTr(ilIdPessjur)+' AS IDPESSJUR '+
           ' FROM DUAL ';

  bOpcaoValida := RegraBooleana(qrypatro.FieldByName('IdRegraValidaOp3').AsString,
                                sSQL, bErro);

  if bErro
  then begin
    MsgDlg('Ocorreu um erro na Regra de Validação da Opção : '+lblNomeValorBase3.Caption +
           'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk],0);
    edOpcao3.Text := '';
  end
  else begin
    if not bOpcaoValida
    then begin
       MsgDlg('O valor '+edOpcao3.Text+ ' foi considerado inválido pela Regra de Validação da Opção '+lblNomeValorBase3.Caption,
              'Erro',mtError,[mbOk],0);
       edOpcao3.Text := '';
    end;
  end;


end;

procedure TFrmCadOpcoesElegivel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  If frmCadDepenBenef <> Nil Then
   Begin
    frmCadDepenBenef.qryDet.FieldByName('VALORBASE1').AsString := edOpcao1.Text;
    frmCadDepenBenef.qryDet.FieldByName('VALORBASE2').AsString := edOpcao2.Text;
    frmCadDepenBenef.qryDet.FieldByName('VALORBASE3').AsString := edOpcao3.Text;
   End
  Else inherited;

end;

procedure TFrmCadOpcoesElegivel.edOpcao4BtnClick(Sender: TObject);
var rOpcao : double;
begin
  inherited;
  // Executar regra de calculo da opcao
  if (qrypatro.IsEmpty) or
      (Trim(qrypatro.FieldByName('IdRegraCalcOp4').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcao(qrypatro.FieldByName('IdRegraCalcOp4').AsInteger,
                         'Opção 4');
  edOpcao4.Text  := FloatToStr(rOpcao);
end;

procedure TFrmCadOpcoesElegivel.edOpcao4Exit(Sender: TObject);
var sSQL, sOpcao : string;
    bErro,
    bOpcaoValida : boolean;
begin
  inherited;
  If frmCadDepenBenef <> Nil
   Then exit;

  // Executar regra de validacao da opcao
  if (qrypatro.IsEmpty) or
     (Trim(qrypatro.FieldByName('IdRegraValidaOp4').AsString) = '') or
     (Trim(edOpcao4.Text) = '')
  then Exit;

  sOpcao := OraNumero(Trim(edOpcao1.Text));
  sSQL :=  '  SELECT '+sOpcao+' AS VALORBASE , '+
                       IntToSTr(ilIdPessjur)+' AS IDPESSJUR '+
           ' FROM DUAL ';

  bOpcaoValida := RegraBooleana(qrypatro.FieldByName('IdRegraValidaOp4').AsString,
                                sSQL, bErro);

  if bErro
  then begin
    MsgDlg('Ocorreu um erro na Regra de Validação da Opção : '+lblNomeValorBase4.Caption +
           'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk],0);
    edOpcao4.Text := '';
  end
  else begin
    if not bOpcaoValida
    then begin
       MsgDlg('O valor '+edOpcao4.Text+ ' foi considerado inválido pela Regra de Validação da Opção '+lblNomeValorBase4.Caption,
              'Erro',mtError,[mbOk],0);
       edOpcao1.Text := '';
    end;
  end;

end;

procedure TFrmCadOpcoesElegivel.edOpcao5BtnClick(Sender: TObject);
var rOpcao : double;
begin
  inherited;
  // Executar regra de calculo da opcao
  if (qrypatro.IsEmpty) or
     (Trim(qrypatro.FieldByName('IdRegraCalcOp5').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcao(qrypatro.FieldByName('IdRegraCalcOp5').AsInteger,
                         'Opção 5');
  edOpcao5.Text  := FloatToStr(rOpcao);
end;

procedure TFrmCadOpcoesElegivel.edOpcao5Exit(Sender: TObject);
var sSQL, sOpcao : string;
    bErro,
    bOpcaoValida : boolean;
begin
  inherited;
  If frmCadDepenBenef <> Nil
   Then exit;

  // Executar regra de validacao da opcao
  if (qrypatro.IsEmpty) or
     (Trim(qrypatro.FieldByName('IdRegraValidaOp5').AsString) = '') or
     (Trim(edOpcao5.Text) = '')
  then Exit;

  sOpcao := OraNumero(Trim(edOpcao5.Text));
  sSQL :=  '  SELECT '+sOpcao+' AS VALORBASE , '+
                       IntToSTr(ilIdPessjur)+' AS IDPESSJUR '+
           ' FROM DUAL ';

  bOpcaoValida := RegraBooleana(qrypatro.FieldByName('IdRegraValidaOp5').AsString,
                                sSQL, bErro);

  if bErro
  then begin
    MsgDlg('Ocorreu um erro na Regra de Validação da Opção : '+lblNomeValorBase5.Caption +
           'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk],0);
    edOpcao5.Text := '';
  end
  else begin
    if not bOpcaoValida
    then begin
       MsgDlg('O valor '+edOpcao5.Text+ ' foi considerado inválido pela Regra de Validação da Opção '+lblNomeValorBase5.Caption,
              'Erro',mtError,[mbOk],0);
       edOpcao5.Text := '';
    end;
  end;
end;

procedure TFrmCadOpcoesElegivel.edOpcao6BtnClick(Sender: TObject);
var rOpcao : double;
begin
  inherited;
  // Executar regra de calculo da opcao
  if (qrypatro.IsEmpty) or
     (Trim(qrypatro.FieldByName('IdRegraCalcOp6').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcao(qrypatro.FieldByName('IdRegraCalcOp6').AsInteger,
                         'Opção 6');
  edOpcao6.Text  := FloatToStr(rOpcao);
end;

procedure TFrmCadOpcoesElegivel.edOpcao6Exit(Sender: TObject);
var sSQL, sOpcao : string;
    bErro,
    bOpcaoValida : boolean;
begin
  inherited;
  If frmCadDepenBenef <> Nil
   Then exit;

  // Executar regra de validacao da opcao
  if (qrypatro.IsEmpty) or
     (Trim(qrypatro.FieldByName('IdRegraValidaOp6').AsString) = '') or
     (Trim(edOpcao6.Text) = '')
  then Exit;

  sOpcao := OraNumero(Trim(edOpcao3.Text));
  sSQL :=  '  SELECT '+sOpcao+' AS VALORBASE , '+
                       IntToSTr(ilIdPessjur)+' AS IDPESSJUR '+
           ' FROM DUAL ';

  bOpcaoValida := RegraBooleana(qrypatro.FieldByName('IdRegraValidaOp6').AsString,
                                sSQL, bErro);

  if bErro
  then begin
    MsgDlg('Ocorreu um erro na Regra de Validação da Opção : '+lblNomeValorBase6.Caption +
           'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk],0);
    edOpcao6.Text := '';
  end
  else begin
    if not bOpcaoValida
    then begin
       MsgDlg('O valor '+edOpcao6.Text+ ' foi considerado inválido pela Regra de Validação da Opção '+lblNomeValorBase6.Caption,
              'Erro',mtError,[mbOk],0);
       edOpcao6.Text := '';
    end;
  end;

end;

end.
