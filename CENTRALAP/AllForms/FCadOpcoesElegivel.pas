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
  private
    { Private declarations }
    rlOpcao1,rlOpcao2,rlOpcao3 : real;
    slDataEvento, slDataInicio : string;
    ilIdPessJur,  ilIdPessoa : longint;
  public
    function LerOpcoes(sNomeTit,sNomePatro,
                       sNomeValorBase1, sNomeValorBase2, sNomeValorBase3 : string;
                       iNumOpcoes : integer;
                       var rOpcao1, rOpcao2, rOpcao3 : real;
                       bEnabled : boolean;
                       iEditaOp1, iEditaOp2, iEditaOp3 : integer;
                       piIdPessJur, piIdPessoa  : longint;
                       psDataEvento, psDataInicio : string) : boolean;
     function CalculaOpcao(piIdRegraCalculo : longint; sTitulo : string) : double;
    { Public declarations }
  end;

var
  FrmCadOpcoesElegivel: TFrmCadOpcoesElegivel;

implementation

uses fAguarde, UAdmPrev, UMensErro;

function TFrmCadOpcoesElegivel.CalculaOpcao(piIdRegraCalculo : longint; sTitulo : string) : double;
var sSQL, sOpcao : string;
    rOpcao1, rOpcao2, rOpcao3 : double;
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

  rOpcao1 := 0;
  rOpcao2 := 0;
  rOpcao3 := 0;
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

  
  if sTitulo = 'Opção 1'
  then
    sOpcao := edOpcao1.Text
      else if sTitulo = 'Opção 2'
      then
        sOpcao := edOpcao2.Text
          else if sTitulo = 'Opção 3'
          then
            sOpcao := edOpcao3.Text;



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
                                      sNomeValorBase1, sNomeValorBase2, sNomeValorBase3 : string;
                                      iNumOpcoes : integer;
                                      var rOpcao1, rOpcao2, rOpcao3 : real;
                                      bEnabled : boolean;
                                      iEditaOp1, iEditaOp2, iEditaOp3 : integer;
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

   if Trim(sNomeValorBase1) <> ''
   then lblNomeValorBase1.Caption := sNomeValorBase1
   else lblNomeValorBase1.Caption := 'Opção 1';

   if Trim(sNomeValorBase2) <> ''
   then lblNomeValorBase2.Caption := sNomeValorBase2
   else lblNomeValorBase2.Caption := 'Opção 2';

   if Trim(sNomeValorBase3) <> ''
   then lblNomeValorBase3.Caption := sNomeValorBase3
   else lblNomeValorBase3.Caption := 'Opção 3';

   lblNomeValorBase1.Visible := (iNumOpcoes >= 1);
   lblNomeValorBase2.Visible := (iNumOpcoes >= 2);
   lblNomeValorBase3.Visible := (iNumOpcoes >= 3);

   edOpcao1.Visible := (iNumOpcoes >= 1);
   edOpcao2.Visible := (iNumOpcoes >= 2);
   edOpcao3.Visible := (iNumOpcoes >= 3);

   edOpcao1.Text    := FormatFloat('#0.00000',rOpcao1);
   edOpcao2.Text    := FormatFloat('#0.00000',rOpcao2);
   edOpcao3.Text    := FormatFloat('#0.00000',rOpcao3);

   edOpcao1.Enabled := (iEditaOp1 = 1);
   edOpcao2.Enabled := (iEditaOp2 = 1);
   edOpcao3.Enabled := (iEditaOp3 = 1);
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
   end
   else begin
      rOpcao2 := -1;
      rOpcao3 := -1;
      rOpcao1 := -1;
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
  sOpcoes := '';

  if not edOpcao1.Enabled
  then sOpcoes := lblNomeValorBase1.Caption+', ';

  if not edOpcao2.Enabled
  then sOpcoes := sOpcoes + lblNomeValorBase2.Caption+', ';

  if not edOpcao3.Enabled
  then sOpcoes := sOpcoes + lblNomeValorBase3.Caption;

  if pnlOpcoes.Enabled
  then
     if ((edOpcao1.Visible) and (not edOpcao1.Enabled)) or
        ((edOpcao2.Visible) and (not edOpcao2.Enabled)) or
        ((edOpcao3.Visible) and (not edOpcao3.Enabled))
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

end.
