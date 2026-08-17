// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Pendência   : 1581
// Autor(a)    : Ricardo Vigorito
// Data        : 23/12/2003
// Alteração   :  inclusão dos campos  IDREGRACALCOP4,IDREGRAVALIDAOP4,
//                 IDREGRAVALIDAOP5 e IDREGRAVALIDAOP6  na query qrypatro
//------------------------------------------------------------------------------
//*****************************************************************************
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------
unit FCadOpcoesPartAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask,
  MskEdDlg, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti;

type
  TFrmCadOpcoesPartAss = class(TfrmOkCancelar)
    pnlParticipante: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edNomePartAss: TEdit;
    edPlanAss: TEdit;
    pnlOpcoes: TPanel;
    Label11: TLabel;
    lblNomeValorBase1: TLabel;
    lblNomeValorBase3: TLabel;
    lblNomeValorBase2: TLabel;
    edOpcao1: TcmMaskEditDlg;
    edOpcao2: TcmMaskEditDlg;
    edOpcao3: TcmMaskEditDlg;
    qryAux: TwwQuery;
    lblNomeValorBase4: TLabel;
    lblNomeValorBase6: TLabel;
    lblNomeValorBase5: TLabel;
    edOpcao4: TcmMaskEditDlg;
    edOpcao5: TcmMaskEditDlg;
    edOpcao6: TcmMaskEditDlg;
    Label2: TLabel;
    lblNomeValorBase8: TLabel;
    lblNomeValorBase7: TLabel;
    edOpcao7: TcmMaskEditDlg;
    edOpcao8: TcmMaskEditDlg;
    qryPlano: TwwQuery;
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edOpcao1BtnClick(Sender: TObject);
    procedure edOpcao2BtnClick(Sender: TObject);
    procedure edOpcao3BtnClick(Sender: TObject);
    procedure edOpcao4BtnClick(Sender: TObject);
    procedure edOpcao5BtnClick(Sender: TObject);
    procedure edOpcao6BtnClick(Sender: TObject);
    procedure edOpcao7BtnClick(Sender: TObject);
    procedure edOpcao8BtnClick(Sender: TObject);
    procedure edOpcao1Exit(Sender: TObject);
    procedure edOpcao2Exit(Sender: TObject);
    procedure edOpcao3Exit(Sender: TObject);
    procedure edOpcao4Exit(Sender: TObject);
    procedure edOpcao5Exit(Sender: TObject);
    procedure edOpcao6Exit(Sender: TObject);
    procedure edOpcao7Exit(Sender: TObject);
    procedure edOpcao8Exit(Sender: TObject);
  private
    { Private declarations }
    sSQL,
    sOpcao : string;
    bErro,
    bOpcaoValida             : Boolean;

    procedure HabilitaComps;
    function CalcTamBot(bValor : Boolean) : Integer;
    function CalculaOpcao(piIdRegraCalculo : longint; sTitulo : string) : double;
    function ValidaOpcao(psEdit, psCampo, psLabel : String): Boolean;
    function MontaQueryRegra : String;
  public
    { Public declarations }
  end;

var
  FrmCadOpcoesPartAss: TFrmCadOpcoesPartAss;

implementation

uses fAguarde, UAdmPrev, UMensErro, FCadDepenBenef, FCadPartAss;

{$R *.DFM}

procedure TFrmCadOpcoesPartAss.HabilitaComps;
begin
  lblNomeValorBase1.Visible := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 1);
  lblNomeValorBase1.Caption := qryPlano.FieldByName('NOMEVALORBASE1').AsString;
  edOpcao1.Visible          := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 1);
  edOpcao1.BtnWidth         := CalcTamBot(qryPlano.FieldByName('IDREGRACALCOP1').AsInteger > 0);

  lblNomeValorBase2.Visible := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 2);
  lblNomeValorBase2.Caption := qryPlano.FieldByName('NOMEVALORBASE2').AsString;
  edOpcao2.Visible          := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 2);
  edOpcao2.BtnWidth         := CalcTamBot(qryPlano.FieldByName('IDREGRACALCOP2').AsInteger > 0);

  lblNomeValorBase3.Visible := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 3);
  lblNomeValorBase3.Caption := qryPlano.FieldByName('NOMEVALORBASE3').AsString;
  edOpcao3.Visible          := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 3);
  edOpcao3.BtnWidth         := CalcTamBot(qryPlano.FieldByName('IDREGRACALCOP3').AsInteger > 0);

  lblNomeValorBase4.Visible := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 4);
  lblNomeValorBase4.Caption := qryPlano.FieldByName('NOMEVALORBASE4').AsString;
  edOpcao4.Visible          := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 4);
  edOpcao4.BtnWidth         := CalcTamBot(qryPlano.FieldByName('IDREGRACALCOP4').AsInteger > 0);

  lblNomeValorBase5.Visible := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 5);
  lblNomeValorBase5.Caption := qryPlano.FieldByName('NOMEVALORBASE5').AsString;
  edOpcao5.Visible          := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 5);
  edOpcao5.BtnWidth         := CalcTamBot(qryPlano.FieldByName('IDREGRACALCOP5').AsInteger > 0);

  lblNomeValorBase6.Visible := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 6);
  lblNomeValorBase6.Caption := qryPlano.FieldByName('NOMEVALORBASE6').AsString;
  edOpcao6.Visible          := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 6);
  edOpcao6.BtnWidth         := CalcTamBot(qryPlano.FieldByName('IDREGRACALCOP6').AsInteger > 0);

  lblNomeValorBase7.Visible := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 7);
  lblNomeValorBase7.Caption := qryPlano.FieldByName('NOMEVALORBASE7').AsString;
  edOpcao7.Visible          := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 7);
  edOpcao7.BtnWidth         := CalcTamBot(qryPlano.FieldByName('IDREGRACALCOP7').AsInteger > 0);

  lblNomeValorBase8.Visible := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 8);
  lblNomeValorBase8.Caption := qryPlano.FieldByName('NOMEVALORBASE8').AsString;
  edOpcao8.Visible          := (qryPlano.FieldByName('NUMOPCOES').AsInteger >= 8);
  edOpcao8.BtnWidth         := CalcTamBot(qryPlano.FieldByName('IDREGRACALCOP8').AsInteger > 0);
end;

function TFrmCadOpcoesPartAss.CalcTamBot(bValor: Boolean): Integer;
begin
  If bValor
   Then Result := 17
   Else Result := 0;
end;

function TFrmCadOpcoesPartAss.CalculaOpcao(piIdRegraCalculo: Integer;
  sTitulo: string): double;
var sSQL, sOpcao : string;
    bErro    : boolean;
    sMsgErro : string;
    j        : Integer;
begin
  inherited;

  Result := 0;
  // Executar regra de calculo da opcao
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
    sOpcao := edOpcao6.Text
  else if sTitulo = 'Opção 7'
  then
    sOpcao := edOpcao7.Text
  else if sTitulo = 'Opção 8'
  then
    sOpcao := edOpcao8.Text;



  frmAguarde.Mostra('Regra de Cálculo da '+sTitulo+' do Plano Assistencial '+edPlanAss.Text);

  try
     sOpcao := RegraNumerica(inttostr(piIdRegraCalculo), MontaQueryRegra,bErro,j);

     if bErro
     then begin
       MsgDlg('Ocorreu um erro na Regra de Cálculo da Opção : '+lblNomeValorBase1.Caption+'','Erro',mtError,[mbOk],0);
       edOpcao1.Text := '';
     end;

  except
     frmAguarde.Apaga;
  end;
  qryAux.Close;
  frmAguarde.Apaga;
  if bErro
  then begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
    TiraSQL(qryAux);
    Exit;
  end
  else Result := strtofloat(clientenumero(sOpcao));
end;

function TFrmCadOpcoesPartAss.ValidaOpcao(psEdit,  psCampo, psLabel: String): Boolean;
begin
  sOpcao := OraNumero(Trim(psEdit));

  bOpcaoValida := RegraBooleana(qryPlano.FieldByName(psCampo).AsString,
                                MontaQueryRegra, bErro);

  If bErro
   Then  MsgDlg('Ocorreu um erro na Regra de Validação da Opção : '+ psLabel +
               'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk],0)
   Else Begin
    If Not bOpcaoValida
     Then MsgDlg('O valor '+psEdit+ ' foi considerado inválido pela Regra de Validação da Opção '+psLabel,
                'Erro',mtError,[mbOk],0);
   End;
  Result := (Not bErro) And (bOpcaoValida);
end;

procedure TFrmCadOpcoesPartAss.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmCadOpcoesPartAss.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TFrmCadOpcoesPartAss.FormShow(Sender: TObject);
begin
  inherited;
  HabilitaComps;
  edOpcao1.SetFocus;
end;

procedure TFrmCadOpcoesPartAss.bbtnConfirmarClick(Sender: TObject);
begin
  // Crítica de campos
  If (edOpcao1.Visible) And
     (Trim(edOpcao1.Text) = '') And
     (qryPlano.fieldbyname('FLGOBRIGAOP1').AsInteger = 1)
   Then Begin
     If MsgDlg('Opção 1 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
      Then Begin
        edOpcao1.SetFocus;
        ModalResult := mrNone;
        Abort;
      End
      Else edOpcao1.Text := '0';
   End;

  If (edOpcao2.Visible) And
     (Trim(edOpcao2.Text) = '') And
     (qryPlano.fieldbyname('FLGOBRIGAOP2').AsInteger = 1)
   Then Begin
     If MsgDlg('Opção 2 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
      Then Begin
        edOpcao2.SetFocus;
        ModalResult := mrNone;
        Abort;
      End
      Else edOpcao2.Text := '0';
   End;

  If (edOpcao3.Visible) And
     (Trim(edOpcao3.Text) = '') And
     (qryPlano.fieldbyname('FLGOBRIGAOP3').AsInteger = 1)
   Then Begin
     If MsgDlg('Opção 3 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
      Then Begin
        edOpcao3.SetFocus;
        ModalResult := mrNone;
        Abort;
      End
      Else edOpcao3.Text := '0';
   End;

  If (edOpcao4.Visible) And
     (Trim(edOpcao4.Text) = '') And
     (qryPlano.fieldbyname('FLGOBRIGAOP4').AsInteger = 1)
   Then Begin
     If MsgDlg('Opção 4 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
      Then Begin
        edOpcao4.SetFocus;
        ModalResult := mrNone;
        Abort;
      End
      Else edOpcao4.Text := '0';
   End;

  If (edOpcao5.Visible) And
     (Trim(edOpcao5.Text) = '') And
     (qryPlano.fieldbyname('FLGOBRIGAOP5').AsInteger = 1)
   Then Begin
     If MsgDlg('Opção 5 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
      Then Begin
        edOpcao5.SetFocus;
        ModalResult := mrNone;
        Abort;
      End
      Else edOpcao5.Text := '0';
   End;

  If (edOpcao6.Visible) And
     (Trim(edOpcao6.Text) = '') And
     (qryPlano.fieldbyname('FLGOBRIGAOP6').AsInteger = 1)
   Then Begin
     If MsgDlg('Opção 6 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
      Then Begin
        edOpcao6.SetFocus;
        ModalResult := mrNone;
        Abort;
      End
      Else edOpcao6.Text := '0';
   End;

  If (edOpcao7.Visible) And
     (Trim(edOpcao7.Text) = '') And
     (qryPlano.fieldbyname('FLGOBRIGAOP7').AsInteger = 1)
   Then Begin
     If MsgDlg('Opção 7 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
      Then Begin
        edOpcao7.SetFocus;
        ModalResult := mrNone;
        Abort;
      End
      Else edOpcao7.Text := '0';
   End;

  If (edOpcao8.Visible) And
     (Trim(edOpcao8.Text) = '') And
     (qryPlano.fieldbyname('FLGOBRIGAOP8').AsInteger = 1)
   Then Begin
     If MsgDlg('Opção 8 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo
      Then Begin
        edOpcao8.SetFocus;
        ModalResult := mrNone;
        Abort;
      End
      Else edOpcao8.Text := '0';
   End;

  // Crítica de campos - Fim
  Close;
end;

procedure TFrmCadOpcoesPartAss.edOpcao1BtnClick(Sender: TObject);
begin
  inherited;
  // Executar regra de calculo da opcao 1
  edOpcao1.Text := FloatToStr(CalculaOpcao(qryPlano.FieldByName('IDREGRACALCOP1').AsInteger, 'Opção 1'));
end;

procedure TFrmCadOpcoesPartAss.edOpcao2BtnClick(Sender: TObject);
begin
  inherited;
  // Executar regra de calculo da opcao 2
  edOpcao2.Text := FloatToStr(CalculaOpcao(qryPlano.FieldByName('IDREGRACALCOP2').AsInteger, 'Opção 2'));
end;

procedure TFrmCadOpcoesPartAss.edOpcao3BtnClick(Sender: TObject);
begin
  inherited;
  // Executar regra de calculo da opcao 3
  edOpcao3.Text := FloatToStr(CalculaOpcao(qryPlano.FieldByName('IDREGRACALCOP3').AsInteger, 'Opção 3'));
end;

procedure TFrmCadOpcoesPartAss.edOpcao4BtnClick(Sender: TObject);
begin
  inherited;
  // Executar regra de calculo da opcao 4
  edOpcao4.Text := FloatToStr(CalculaOpcao(qryPlano.FieldByName('IDREGRACALCOP4').AsInteger, 'Opção 4'));
end;

procedure TFrmCadOpcoesPartAss.edOpcao5BtnClick(Sender: TObject);
begin
  inherited;
  // Executar regra de calculo da opcao 5
  edOpcao5.Text := FloatToStr(CalculaOpcao(qryPlano.FieldByName('IDREGRACALCOP5').AsInteger, 'Opção 5'));
end;

procedure TFrmCadOpcoesPartAss.edOpcao6BtnClick(Sender: TObject);
begin
  inherited;
  // Executar regra de calculo da opcao 6
  edOpcao6.Text := FloatToStr(CalculaOpcao(qryPlano.FieldByName('IDREGRACALCOP6').AsInteger, 'Opção 6'));
end;

procedure TFrmCadOpcoesPartAss.edOpcao7BtnClick(Sender: TObject);
begin
  inherited;
  // Executar regra de calculo da opcao 7
  edOpcao7.Text := FloatToStr(CalculaOpcao(qryPlano.FieldByName('IDREGRACALCOP7').AsInteger, 'Opção 7'));
end;

procedure TFrmCadOpcoesPartAss.edOpcao8BtnClick(Sender: TObject);
begin
  inherited;
  // Executar regra de calculo da opcao 8
  edOpcao8.Text := FloatToStr(CalculaOpcao(qryPlano.FieldByName('IDREGRACALCOP8').AsInteger, 'Opção 8'));
end;

procedure TFrmCadOpcoesPartAss.edOpcao1Exit(Sender: TObject);
begin
  inherited;
  // Executar regra de validacao da opcao
  If (Trim(qryPlano.FieldByName('IDREGRAVALOP1').AsString) = '') or
     (Trim(edOpcao1.Text) = '')
    Then Exit;

  If Not ValidaOpcao('IDREGRAVALOP1', edOpcao1.Text, lblNomeValorBase1.Caption)
   Then edOpcao1.Text := '';
end;

procedure TFrmCadOpcoesPartAss.edOpcao2Exit(Sender: TObject);
begin
  inherited;
  // Executar regra de validacao da opcao
  If (Trim(qryPlano.FieldByName('IDREGRAVALOP2').AsString) = '') or
     (Trim(edOpcao2.Text) = '')
    Then Exit;

  If Not ValidaOpcao('IDREGRAVALOP2', edOpcao2.Text, lblNomeValorBase2.Caption)
   Then edOpcao2.Text := '';
end;

procedure TFrmCadOpcoesPartAss.edOpcao3Exit(Sender: TObject);
begin
  inherited;
  // Executar regra de validacao da opcao
  If (Trim(qryPlano.FieldByName('IDREGRAVALOP3').AsString) = '') or
     (Trim(edOpcao3.Text) = '')
    Then Exit;

  If Not ValidaOpcao('IDREGRAVALOP3', edOpcao3.Text, lblNomeValorBase3.Caption)
   Then edOpcao3.Text := '';
end;

procedure TFrmCadOpcoesPartAss.edOpcao4Exit(Sender: TObject);
begin
  inherited;
  // Executar regra de validacao da opcao
  If (Trim(qryPlano.FieldByName('IDREGRAVALOP4').AsString) = '') or
     (Trim(edOpcao4.Text) = '')
    Then Exit;

  If Not ValidaOpcao('IDREGRAVALOP4', edOpcao4.Text, lblNomeValorBase4.Caption)
   Then edOpcao1.Text := '';
end;

procedure TFrmCadOpcoesPartAss.edOpcao5Exit(Sender: TObject);
begin
  inherited;
  // Executar regra de validacao da opcao
  If (Trim(qryPlano.FieldByName('IDREGRAVALOP5').AsString) = '') or
     (Trim(edOpcao5.Text) = '')
    Then Exit;

  If Not ValidaOpcao('IDREGRAVALOP5', edOpcao5.Text, lblNomeValorBase5.Caption)
   Then edOpcao5.Text := '';
end;

procedure TFrmCadOpcoesPartAss.edOpcao6Exit(Sender: TObject);
begin
  inherited;
  // Executar regra de validacao da opcao
  If (Trim(qryPlano.FieldByName('IDREGRAVALOP6').AsString) = '') or
     (Trim(edOpcao6.Text) = '')
    Then Exit;

  If Not ValidaOpcao('IDREGRAVALOP6', edOpcao6.Text, lblNomeValorBase6.Caption)
   Then edOpcao6.Text := '';
end;

procedure TFrmCadOpcoesPartAss.edOpcao7Exit(Sender: TObject);
begin
  inherited;
  // Executar regra de validacao da opcao
  If (Trim(qryPlano.FieldByName('IDREGRAVALOP7').AsString) = '') or
     (Trim(edOpcao7.Text) = '')
    Then Exit;

  If Not ValidaOpcao('IDREGRAVALOP7', edOpcao7.Text, lblNomeValorBase7.Caption)
   Then edOpcao7.Text := '';
end;

procedure TFrmCadOpcoesPartAss.edOpcao8Exit(Sender: TObject);
begin
  inherited;
  // Executar regra de validacao da opcao
  If (Trim(qryPlano.FieldByName('IDREGRAVALOP8').AsString) = '') or
     (Trim(edOpcao8.Text) = '')
    Then Exit;

  If Not ValidaOpcao('IDREGRAVALOP8', edOpcao8.Text, lblNomeValorBase8.Caption)
   Then edOpcao8.Text := '';
end;

function TFrmCadOpcoesPartAss.MontaQueryRegra: String;
Var
 sSql : String;
begin
   sSql :=  'SELECT PE.IDPESSOA, PF.DATANASC, PF.SEXO, PF.ESTCIVIL, PF.DATAMORTE, EL.MATRICULA, PP.INSCRICAONUMERO,'+#13+
            '      '+FrmCadPartAss.dblkPlano.LookupValue+' AS IDPLANASS, '+#13+
            '      '+QuotedStr(FrmCadPartAss.dbtpDataInscricao.Text)+' AS DATAENTRADA, '+#13;
   If FrmCadPartAss.chkOpcaoA.Checked
   Then sSql := sSql +'       1 AS OPCAOA, '+#13
   Else sSql := sSql +'       0 AS OPCAOA, '+#13;

   If Trim(edOpcao1.Text) <> ''
   Then sSql := sSql +'      '+ (Trim(edOpcao1.Text))+' AS VALORBASE1, ';

   If Trim(edOpcao2.Text) <> ''
   Then sSql := sSql +'      '+ (Trim(edOpcao2.Text))+' AS VALORBASE2, ';

   If Trim(edOpcao3.Text) <> ''
   Then sSql := sSql +'      '+ (Trim(edOpcao3.Text))+' AS VALORBASE3, ';

   If Trim(edOpcao4.Text) <> ''
   Then sSql := sSql +'      '+ (Trim(edOpcao4.Text))+' AS VALORBASE4, ';

   If Trim(edOpcao5.Text) <> ''
   Then sSql := sSql +'      '+ (Trim(edOpcao5.Text))+' AS VALORBASE5, ';

   If Trim(edOpcao6.Text) <> ''
   Then sSql := sSql +'      '+ (Trim(edOpcao6.Text))+' AS VALORBASE6, ';

   If Trim(edOpcao7.Text) <> ''
   Then sSql := sSql +'      '+ (Trim(edOpcao7.Text))+' AS VALORBASE7, ';

   If Trim(edOpcao8.Text) <> ''
   Then sSql := sSql +'      '+ (Trim(edOpcao8.Text))+' AS VALORBASE8, ';

   sSql := Copy(sSQL, 1, Length(sSql)-2)+#13;

   sSql := sSql + 'FROM PARTPREVPLAN PP, ELEGPATRO EL, PESSOA PE, PESSOAFISICA PF '+#13+
                  'WHERE PE.IDPESSOA = '+FrmCadPartAss.qry.FieldByName('IDPESSOA').AsString+#13+
                  '  AND PF.IDPESSOA = PE.IDPESSOA'+#13+
                  '  AND PP.IDPESSOA = PF.IDPESSOA'+#13+
                  '  AND PP.IDPLANOPREV = '+FrmCadPartAss.qry.FieldByName('IDPLANOPREV').AsString+#13+
                  '  AND PP.IDPESSJUR = '+FrmCadPartAss.qry.FieldByName('IDPESSJUR').AsString+#13+
                  '  AND EL.IDPESSJUR = PP.IDPESSJUR'+#13+
                  '  AND EL.IDPESSOA = PP.IDPESSOA';

   Result := sSql;
end;

end.
