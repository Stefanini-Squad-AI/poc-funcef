// -----------------------------------------------------------------------------
//Alteração  : LerOpcoes
//Nº SIG.....: 47962
//Data.......: 19/01/2018
//Responsável: Edilaine Ferraresi
//Descrição..: Ajuste concessão INSS para flag Está no Convenio e preenchimento
//             automatico do %INSS e Índice de Reajuste do Teto (opções)
//--------------------------------------------------------------------------------
// Rotina    :
// Autor(a)  : André Felipe SOL 160185
// Data      : 14/01/2013
// Descrição : Criação de campos para cadastro do CNPB e Plano Receptor
// -----------------------------------------------------------------------------
// Rotina    : bbtnOpcoesClick
// Autor(a)  : Augusto
// Data      : 20/09/2003
// Descrição : Inclusão do Valor do SRB no calculo do da opcoao  
// -----------------------------------------------------------------------------
unit FCadOpcoesBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, TEdNum,
  TB97Tlbr, Mask, MskEdDlg, Db, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti;

type
  TfrmCadOpcoesBenef = class(TfrmOkCancelar)
    pnlOpcoes: TPanel;
    Label11: TLabel;
    pnlParticipante: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edNomeTit: TEdit;
    edPatroTit: TEdit;
    edPlanoTit: TEdit;
    Label10: TLabel;
    edBeneficio: TEdit;
    lblNomeValorBase1: TLabel;
    lblNomeValorBase3: TLabel;
    lblNomeValorBase2: TLabel;
    edOpcao1: TcmMaskEditDlg;
    edOpcao2: TcmMaskEditDlg;
    edOpcao3: TcmMaskEditDlg;
    qryBeneficio: TwwQuery;
    qryPart: TwwQuery;
    qryAux: TwwQuery;
    pnl1: TPanel;
    Lbl1: TLabel;
    lblOpcaoTexto1: TLabel;
    lblOpcaoTexto3: TLabel;
    lblOpcaoTexto2: TLabel;
    edtCampoTexto1: TcmMaskEditDlg;
    edtCampoTexto2: TcmMaskEditDlg;
    edtCampoTexto3: TcmMaskEditDlg;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edOpcao1BtnClick(Sender: TObject);
    procedure edOpcao2BtnClick(Sender: TObject);
    procedure edOpcao3BtnClick(Sender: TObject);
    procedure edOpcao1Exit(Sender: TObject);
    procedure edOpcao2Exit(Sender: TObject);
    procedure edOpcao3Exit(Sender: TObject);
    procedure edtCampoTexto1Exit(Sender: TObject);
    procedure edtCampoTexto2Exit(Sender: TObject);
    procedure edtCampoTexto3Exit(Sender: TObject);
    procedure edtCampoTexto1BtnClick(Sender: TObject);
    procedure edtCampoTexto2BtnClick(Sender: TObject);
    procedure edtCampoTexto3BtnClick(Sender: TObject);
  private
    { Private declarations }
    rlOpcao1,rlOpcao2,rlOpcao3 : real;
    slDataRequerimento,
    slDataEvento, slDataInicio,
    slDataInicioINSS,
    slVlrInfINSS,
    slValorCalcINSS,
    sValorSRB,
    slValorBase1INSS,
    slValorBase2INSS,
    slValorBase3INSS,
    slFlgInternoAntes,
    slFlgInternoAtual,
    slIdSitPartAntes,
    slIdSitPlanAntes,
    slIdSitFuncAntes,
    slIdSitPartAtual,
    slIdSitPlanAtual,
    slIdSitFuncAtual      : string;

    ilIdPessJur, ilIdPlanoPrev, ilIdPessoa, ilSeqProposta ,
    ilIdBeneficio, ilNumeroProcesso: longint;
  public
    { Public declarations }

    function LerOpcoes( sNomeTit,
                        sNomePlano,
                        sNomePatro,
                        sBeneficio,
                        sNomeValorBase1,
                        sNomeValorBase2,
                        sNomeValorBase3       : string;
                        iNumOpcoes            : integer;
                        var rOpcao1,
                        rOpcao2,
                        rOpcao3               : real;
                        bEnabled              : boolean;
                        iEditaOp1,
                        iEditaOp2,
                        iEditaOp3             : integer;
                        //INICIO - SOL160185
                        sNomeOpcoesTexto1,
                        sNomeOpcoesTexto2,
                        sNomeOpcoesTexto3       : string;
                        iNumOpcoesTexto           : integer;
                        var rCampoTexto1,
                        rCampoTexto2,
                        rCampoTexto3               : string;
                        iEditaOpTexto1,
                        iEditaOpTexto2,
                        iEditaOpTexto3             : integer;
                        //FIM - SOL160185
                        piIdPessJur,
                        piIdPlanoPrev,
                        piIdPessoa,
                        piSeqProposta,
                        piIdBeneficio,
                        piNumeroProcesso      : longint;
                        psDataEvento,
                        psDataInicio,
                        psDataInicioINSS,
                        psDataRequerimento,
                        psVlrInfINSS,
                        psValorCalcINSS,
                        psValorBase1INSS,
                        psValorBase2INSS,
                        psValorBase3INSS,
                        psFlgInternoAntes,
                        psFlgInternoAtual,
                        psIdSitPartAntes,
                        psIdSitPlanAntes,
                        psIdSitFuncAntes,
                        psIdSitPartAtual,
                        psIdSitPlanAtual,
                        psIdSitFuncAtual      : string;
                        psValorSRB : String = '0';
                        pbExecutaOpcoes : boolean = false   //edlaine - SIG47962
                        ) : boolean;

    function CalculaOpcao(piIdRegraCalculo : longint;
                          sCampo,
                          sTitulo : string

                          ) : double;

    function CalculaOpcaoTexto(piIdRegraCalculo : longint;
                          sCampo,
                          sTitulo : string

                          ) : String;
    end;

var
  frmCadOpcoesBenef: TfrmCadOpcoesBenef;

implementation

uses UMensErro, UAdmPrev, fAguarde, UBeneficio;

{$R *.DFM}

function TfrmCadOpcoesBenef.CalculaOpcao(piIdRegraCalculo : longint;
                                         sCampo,                 
                                         sTitulo : string
                                         ) : double;
var
    rOpcao, rOpcao1, rOpcao2, rOpcao3 : double;
    bErro  : boolean;
    sMsgErro, rOpcaoTexto1, rOpcaoTexto2, rOpcaoTexto3 : string;
begin
  inherited;
  ropcao := 0;
  if not qryBeneficio.Active
  then begin
   qryBeneficio.Close;
   qryBeneficio.ParamByName('IdPlanoPrev').AsInteger := ilIdPlanoPrev;
   qryBeneficio.ParamByName('IdBeneficio').AsInteger := ilIdBeneficio;
   qryBeneficio.Open;
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

  rOpcaoTexto1 := Trim(edtCampoTexto1.Text);
  rOpcaoTexto2 := Trim(edtCampoTexto2.Text);
  rOpcaoTexto3 := Trim(edtCampoTexto3.Text);

  frmAguarde.Mostra('Regra de Cálculo da '+sTitulo+' do Benefício - Nº '+IntToStr(piIdRegraCalculo));

  qryPart.Close;
  qryPart.ParamByName('IdPessoa').Value    := ilIdPessoa;
  qryPart.ParamByName('IdPlanoPrev').Value := ilIdPlanoPrev;
  qryPart.ParamByName('IdPessJur').Value   := ilIdPessJur;
  qryPart.Open;

  try

       

       rOpcao := ExecutaRegraCalculoOpcaoBenef(qryAux,
                                               piIdRegraCalculo,
                                               qryBeneficio.FieldByName('IdRegraPagamento').AsInteger,
                                               ilIdPessJur, ilIdPlanoPrev, ilIdPessoa,ilSeqProposta,
                                               qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                               ilNumeroProcesso,
                                               qryPart.FieldByName('IdSitFunc').AsInteger,
                                               qryPart.FieldByName('IdSitPart').AsInteger,
                                               qryPart.FieldByName('IdSitPlanoPrev').AsInteger,
                                               rOpcao1, rOpcao2, rOpcao3,
                                               slDataEvento,
                                               slDataInicio,
                                               slDataInicioINSS,
                                               slVlrInfINSS,
                                               slDataRequerimento,
                                               slValorCalcINSS,
                                               slValorBase1INSS,
                                               slValorBase2INSS,
                                               slValorBase3INSS,
                                               bErro,
                                               sMsgErro,
                                               iIdCalculoGeral,
                                               slFlgInternoAntes ,
                                               slFlgInternoAtual ,
                                               slIdSitPartAntes  ,
                                               slIdSitPlanAntes  ,
                                               slIdSitFuncAntes  ,
                                               slIdSitPartAtual  ,
                                               slIdSitPlanAtual  ,
                                               slIdSitFuncAtual,
                                               sValorSRB);

  except
     frmAguarde.Apaga;
  end;

  qryPart.Close;
  qryAux.Close;
  frmAguarde.Apaga;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
    TiraSQL(qryAux);
    Exit;
  end
  else
    Result := rOpcao;
end;

function TfrmCadOpcoesBenef.LerOpcoes( sNomeTit,
                                       sNomePlano,
                                       sNomePatro,
                                       sBeneficio,
                                       sNomeValorBase1,
                                       sNomeValorBase2,
                                       sNomeValorBase3       : string;
                                       iNumOpcoes            : integer;
                                       var rOpcao1,
                                       rOpcao2,
                                       rOpcao3               : real;
                                       bEnabled              : boolean;
                                       iEditaOp1,
                                       iEditaOp2,
                                       iEditaOp3             : integer;
                                       //INICIO - SOL160185
                                       sNomeOpcoesTexto1,
                                       sNomeOpcoesTexto2,
                                       sNomeOpcoesTexto3       : string;
                                       iNumOpcoesTexto           : integer;
                                       var rCampoTexto1,
                                       rCampoTexto2,
                                       rCampoTexto3               : string;
                                       iEditaOpTexto1,
                                       iEditaOpTexto2,
                                       iEditaOpTexto3             : integer;
                                       //FIM - SOL160185
                                       piIdPessJur,
                                       piIdPlanoPrev,
                                       piIdPessoa,
                                       piSeqProposta,
                                       piIdBeneficio,
                                       piNumeroProcesso      : longint;
                                       psDataEvento,
                                       psDataInicio,
                                       psDataInicioINSS,
                                       psDataRequerimento,
                                       psVlrInfINSS,
                                       psValorCalcINSS,
                                       psValorBase1INSS,
                                       psValorBase2INSS,
                                       psValorBase3INSS,
                                       psFlgInternoAntes,
                                       psFlgInternoAtual,
                                       psIdSitPartAntes,
                                       psIdSitPlanAntes,
                                       psIdSitFuncAntes,
                                       psIdSitPartAtual,
                                       psIdSitPlanAtual,
                                       psIdSitFuncAtual      : string;
                                       psValorSRB : String = '0';
                                       pbExecutaOpcoes : boolean = false   //edlaine - SIG47962
                                       ) : boolean;
begin
   edNomeTit.Text   := sNomeTit;
   edPlanoTit.Text  := sNomePlano;
   edPatroTit.Text  := sNomePatro;
   edBeneficio.Text := sBeneficio;

   slDataEvento  := psDataEvento;
   slDataInicio  := psDataInicio;
   slDataInicioINSS := psDataInicioINSS;
   slVlrInfINSS     := psVlrInfINSS;

   slValorCalcINSS  :=  psValorCalcINSS;
   sValorSRB        :=  psValorSRB;
   slValorBase1INSS :=  psValorBase1INSS;
   slValorBase2INSS :=  psValorBase2INSS;
   slValorBase3INSS :=  psValorBase3INSS;

   slFlgInternoAntes := psFlgInternoAntes;
   slFlgInternoAtual := psFlgInternoAtual;
   slIdSitPartAntes  := psIdSitPartAntes;
   slIdSitPlanAntes  := psIdSitPlanAntes;
   slIdSitFuncAntes  := psIdSitFuncAntes;
   slIdSitPartAtual  := psIdSitPartAtual;
   slIdSitPlanAtual  := psIdSitPlanAtual;
   slIdSitFuncAtual  := psIdSitFuncAtual;

   ilIdPessJur   := piIdPessJur;
   ilIdPlanoPrev := piIdPlanoPrev;
   ilIdPessoa    := piIdPessoa;
   ilSeqProposta := piSeqProposta;
   ilIdBeneficio := piIdBeneficio;
   ilNumeroProcesso := piNumeroProcesso;
   slDataRequerimento := psDataRequerimento; 

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

   if Trim(sNomeOpcoesTexto1) <> ''
   then lblOpcaoTexto1.Caption := sNomeOpcoesTexto1
   else lblOpcaoTexto1.Caption := 'Opção Texto 1';

   if Trim(sNomeOpcoesTexto2) <> ''
   then lblOpcaoTexto2.Caption := sNomeOpcoesTexto2
   else lblOpcaoTexto2.Caption := 'Opção Texto 2';

   if Trim(sNomeOpcoesTexto3) <> ''
   then lblOpcaoTexto3.Caption := sNomeOpcoesTexto3
   else lblOpcaoTexto3.Caption := 'Opção Texto 3';

   lblOpcaoTexto1.Visible := (iNumOpcoesTexto >= 1);
   lblOpcaoTexto2.Visible := (iNumOpcoesTexto >= 2);
   lblOpcaoTexto3.Visible := (iNumOpcoesTexto >= 3);

   edtCampoTexto1.Visible := (iNumOpcoesTexto >= 1);
   edtCampoTexto2.Visible := (iNumOpcoesTexto >= 2);
   edtCampoTexto3.Visible := (iNumOpcoesTexto >= 3);


   edOpcao1.ReadOnly := (iEditaOp1 = 0);
   edOpcao2.ReadOnly := (iEditaOp2 = 0);
   edOpcao3.ReadOnly := (iEditaOp3 = 0);

   edtCampoTexto1.Text := rCampoTexto1;
   edtCampoTexto2.Text := rCampoTexto2;
   edtCampoTexto3.Text := rCampoTexto3;

   edtCampoTexto1.ReadOnly := (iEditaOpTexto1 = 0);
   edtCampoTexto2.ReadOnly := (iEditaOpTexto2 = 0);
   edtCampoTexto3.ReadOnly := (iEditaOpTexto3 = 0);
   
   pnlOpcoes.Enabled := bEnabled;

   qryBeneficio.Close;
   qryBeneficio.ParamByName('IdPlanoPrev').AsInteger := piIdPlanoPrev;
   qryBeneficio.ParamByName('IdBeneficio').AsInteger := piIdBeneficio;
   qryBeneficio.Open;

   //edilaine - SIG47962 - inicio
   if (pbExecutaOpcoes) and (edOpcao1.Visible) then
      edOpcao1BtnClick(edOpcao1)
   else
      edOpcao1.Text    := FormatFloat('#0.00000',rOpcao1);

   if (pbExecutaOpcoes) and (edOpcao2.Visible) then
      edOpcao2BtnClick(edOpcao2)
   else
      edOpcao2.Text    := FormatFloat('#0.00000',rOpcao2);

   if (pbExecutaOpcoes) and (edOpcao3.Visible) then
      edOpcao3BtnClick(edOpcao3)
   else
      edOpcao3.Text    := FormatFloat('#0.00000',rOpcao3);
   //edilaine - SIG47962 - fim

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

      if edtCampoTexto1.Visible
      then rCampoTexto1 := Trim(edtCampoTexto1.Text)
      else rCampoTexto1 := '';

      if edtCampoTexto2.Visible
      then rCampoTexto2 := Trim(edtCampoTexto2.Text)
      else rCampoTexto2 := '';

      if edtCampoTexto3.Visible
      then rCampoTexto3 := Trim(edtCampoTexto3.Text)
      else rCampoTexto3 := '';
   end
   else begin
      rOpcao2 := -1;
      rOpcao3 := -1;
      rOpcao1 := -1;
      rCampoTexto1 := '';
      rCampoTexto2 := '';
      rCampoTexto3 := '';
   end;
   Result := true;
end;

procedure TfrmCadOpcoesBenef.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmCadOpcoesBenef.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if edOpcao1.Visible and (Trim(edOpcao1.Text) = '')
  then begin
     if MsgDlg('Opção 1 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo
     then begin
        edOpcao1.SetFocus;
        ModalResult := mrNone;
        Abort;
     end
     else edOpcao1.Text := '0';
  end;

  if edOpcao2.Visible and (Trim(edOpcao2.Text) = '')
  then begin
     if MsgDlg('Opção 2 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo
     then begin
        edOpcao2.SetFocus;
        ModalResult := mrNone;
        Abort;
     end
     else edOpcao2.Text := '0';
  end;

  if edOpcao3.Visible and (Trim(edOpcao3.Text) = '')
  then begin
     if MsgDlg('Opção 3 não informada. Deseja registrar valor ZERO ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo
     then begin
        edOpcao3.SetFocus;
        ModalResult := mrNone;
        Abort;
     end
     else edOpcao3.Text := '0';
  end;

  if edtCampoTexto1.Visible and (Trim(edtCampoTexto1.Text) = '')
  then begin
     if MsgDlg('Opção de Texto 1 não informada. Deseja registrar valor '' '' ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo
     then begin
        edtCampoTexto1.SetFocus;
        ModalResult := mrNone;
        Abort;
     end
     else edtCampoTexto1.Text := '';
  end;

  if edtCampoTexto2.Visible and (Trim(edtCampoTexto2.Text) = '')
  then begin
     if MsgDlg('Opção de Texto 2 não informada. Deseja registrar valor '' '' ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo
     then begin
        edtCampoTexto2.SetFocus;
        ModalResult := mrNone;
        Abort;
     end
     else edtCampoTexto2.Text := '';
  end;

  if edtCampoTexto3.Visible and (Trim(edtCampoTexto3.Text) = '')
  then begin
     if MsgDlg('Opção de Texto 3 não informada. Deseja registrar valor '' '' ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo
     then begin
        edtCampoTexto3.SetFocus;
        ModalResult := mrNone;
        Abort;
     end
     else edtCampoTexto3.Text := '';
  end;

  ModalResult := mrOk;
end;

procedure TfrmCadOpcoesBenef.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmCadOpcoesBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryBeneficio.Close;
//  inherited;
end;

procedure TfrmCadOpcoesBenef.edOpcao1BtnClick(Sender: TObject);
var rOpcao : double;
begin
  inherited;
  // Executar regra de calculo da opcao
  if (qryBeneficio.IsEmpty) or
     (Trim(qryBeneficio.FieldByName('IdRegraCalcOp1').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcao(qryBeneficio.FieldByName('IdRegraCalcOp1').AsInteger,
                         'VALORBASE1',
                         'Opção 1');
  edOpcao1.Text  := FloatToStr(rOpcao);
end;


procedure TfrmCadOpcoesBenef.edOpcao2BtnClick(Sender: TObject);
var rOpcao : double;
begin
  inherited;
  // Executar regra de calculo da opcao
  if (qryBeneficio.IsEmpty) or
     (Trim(qryBeneficio.FieldByName('IdRegraCalcOp2').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcao(qryBeneficio.FieldByName('IdRegraCalcOp2').AsInteger,
                         'VALORBASE2',
                         'Opção 2');
  edOpcao2.Text  := FloatToStr(rOpcao);
end;

procedure TfrmCadOpcoesBenef.edOpcao3BtnClick(Sender: TObject);
var rOpcao : double;
begin
  inherited;
  // Executar regra de calculo da opcao
  if (qryBeneficio.IsEmpty) or
     (Trim(qryBeneficio.FieldByName('IdRegraCalcOp3').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcao(qryBeneficio.FieldByName('IdRegraCalcOp3').AsInteger,
                         'VALORBASE3', 
                         'Opção 3');
  edOpcao3.Text  := FloatToStr(rOpcao);
end;

procedure TfrmCadOpcoesBenef.edOpcao1Exit(Sender: TObject);
var sSQL, sOpcao : string;
    bErro,
    bOpcaoValida : boolean;
begin
  inherited;
  // Executar regra de validacao da opcao
  if (qryBeneficio.IsEmpty) or
     (Trim(qryBeneficio.FieldByName('IdRegraValidaOp1').AsString) = '') or
     (Trim(edOpcao1.Text) = '')
  then Exit;

  sOpcao := OraNumero(Trim(edOpcao1.Text));
  sSQL :=  '  SELECT '+PreparaStrRegra(sOpcao)+' AS VALORBASE , '+
                       PreparaStrRegra(sOpcao)+' AS VALORBASE1 , '+
                       IntToSTr(ilIdPlanoPrev)+' AS IDPLANOPREV, '+
                       PreparaStrRegra(qryBeneficio.FieldByName('IdBeneficio').AsString)+' AS IDBENEFICIO  '+
           ' FROM DUAL ';

  bOpcaoValida := RegraBooleana(qryBeneficio.FieldByName('IdRegraValidaOp1').AsString,
                                sSQL, bErro);

  if bErro
  then begin
    MsgDlg('Ocorreu um erro na Regra de Validação da Opção : '+lblNomeValorBase1.Caption +
           'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk,mbHelp],0);
    edOpcao1.Text := '';
  end
  else begin
    if not bOpcaoValida
    then begin
       MsgDlg('O valor '+edOpcao1.Text+ ' foi considerado inválido pela Regra de Validação da Opção '+lblNomeValorBase1.Caption,
              'Erro',mtError,[mbOk,mbHelp],0);
       edOpcao1.Text := '';
    end;
  end;
end;

procedure TfrmCadOpcoesBenef.edOpcao2Exit(Sender: TObject);
var sSQL, sOpcao : string;
    bErro,
    bOpcaoValida : boolean;
begin
  inherited;
  // Executar regra de validacao da opcao
  if (qryBeneficio.IsEmpty) or
     (Trim(qryBeneficio.FieldByName('IdRegraValidaOp2').AsString) = '') or
     (Trim(edOpcao2.Text) = '')
  then Exit;

  sOpcao := OraNumero(Trim(edOpcao2.Text));
  sSQL :=  '  SELECT '+PreparaStrRegra(sOpcao)+' AS VALORBASE , '+
                       PreparaStrRegra(sOpcao)+' AS VALORBASE2 , '+
                       IntToSTr(ilIdPlanoPrev)+' AS IDPLANOPREV, '+
                       PreparaStrRegra(qryBeneficio.FieldByName('IdBeneficio').AsString)+' AS IDBENEFICIO  '+
           ' FROM DUAL ';

  bOpcaoValida := RegraBooleana(qryBeneficio.FieldByName('IdRegraValidaOp2').AsString,
                                sSQL, bErro);

  if bErro
  then begin
    MsgDlg('Ocorreu um erro na Regra de Validação da Opção : '+lblNomeValorBase2.Caption +
           'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk,mbHelp],0);
    edOpcao2.Text := '';
  end
  else begin
    if not bOpcaoValida
    then begin
       MsgDlg('O valor '+edOpcao2.Text+ ' foi considerado inválido pela Regra de Validação da Opção '+lblNomeValorBase2.Caption,
              'Erro',mtError,[mbOk,mbHelp],0);
       edOpcao2.Text := '';
    end;
  end;

end;

procedure TfrmCadOpcoesBenef.edOpcao3Exit(Sender: TObject);
var sSQL, sOpcao : string;
    bErro,
    bOpcaoValida : boolean;
begin
  inherited;
  // Executar regra de validacao da opcao
  if (qryBeneficio.IsEmpty) or
     (Trim(qryBeneficio.FieldByName('IdRegraValidaOp3').AsString) = '') or
     (Trim(edOpcao3.Text) = '')
  then Exit;

  sOpcao := OraNumero(Trim(edOpcao3.Text));
  sSQL :=  '  SELECT '+sOpcao+' AS VALORBASE , '+
                       sOpcao+' AS VALORBASE3 , '+
                       IntToSTr(ilIdPlanoPrev)+' AS IDPLANOPREV, '+
                       qryBeneficio.FieldByName('IdBeneficio').AsString+' AS IDBENEFICIO  '+
           ' FROM DUAL ';

  bOpcaoValida := RegraBooleana(qryBeneficio.FieldByName('IdRegraValidaOp3').AsString,
                                sSQL, bErro);

  if bErro
  then begin
    MsgDlg('Ocorreu um erro na Regra de Validação da Opção : '+lblNomeValorBase3.Caption +
           'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk,mbHelp],0);
    edOpcao3.Text := '';
  end
  else begin
    if not bOpcaoValida
    then begin
       MsgDlg('O valor '+edOpcao3.Text+ ' foi considerado inválido pela Regra de Validação da Opção '+lblNomeValorBase3.Caption,
              'Erro',mtError,[mbOk,mbHelp],0);
       edOpcao3.Text := '';
    end;
  end;

end;

procedure TfrmCadOpcoesBenef.edtCampoTexto1Exit(Sender: TObject);
var sSQL, sOpcao : string;
    bErro,
    bOpcaoValida : boolean;
begin
  inherited;
  // Executar regra de validacao da opcao
  if (qryBeneficio.IsEmpty) or
     (Trim(qryBeneficio.FieldByName('IDREGRAVALIDAOPTEXTO1').AsString) = '') or
     (Trim(edtCampoTexto1.Text) = '')
  then Exit;

  sOpcao := Trim(edtCampoTexto1.Text);
  sSQL :=  '  SELECT '+QuotedStr(PreparaStrRegra(sOpcao))+' AS CAMPOTEXTO,  '+
                       QuotedStr(PreparaStrRegra(sOpcao))+' AS CAMPOTEXTO1, '+
                       IntToSTr(ilIdPlanoPrev)+' AS IDPLANOPREV, '+
                       PreparaStrRegra(qryBeneficio.FieldByName('IdBeneficio').AsString)+' AS IDBENEFICIO  '+
           ' FROM DUAL ';

  bOpcaoValida := RegraBooleana(qryBeneficio.FieldByName('IDREGRAVALIDAOPTEXTO1').AsString,
                                sSQL, bErro);

  if bErro
  then begin
    MsgDlg('Ocorreu um erro na Regra de Validação da Opção de Texto : '+lblOpcaoTexto1.Caption +
           'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk,mbHelp],0);
    edtCampoTexto1.Text := '';
  end
  else begin
    if not bOpcaoValida
    then begin
       MsgDlg('O texto '+edtCampoTexto1.Text+ ' foi considerado inválido pela Regra de Validação da Opção de Texto '+lblOpcaoTexto1.Caption,
              'Erro',mtError,[mbOk,mbHelp],0);
       edtCampoTexto1.Text := '';
    end;
  end;
end;

procedure TfrmCadOpcoesBenef.edtCampoTexto2Exit(Sender: TObject);
var sSQL, sOpcao : string;
    bErro,
    bOpcaoValida : boolean;
begin
  inherited;
    // Executar regra de validacao da opcao
  if (qryBeneficio.IsEmpty) or
     (Trim(qryBeneficio.FieldByName('IDREGRAVALIDAOPTEXTO2').AsString) = '') or
     (Trim(edtCampoTexto2.Text) = '')
  then Exit;

  sOpcao := Trim(edtCampoTexto2.Text);
  sSQL :=  '  SELECT '+QuotedStr(PreparaStrRegra(sOpcao))+' AS CAMPOTEXTO,  '+
                       QuotedStr(PreparaStrRegra(sOpcao))+' AS CAMPOTEXTO2, '+
                       IntToSTr(ilIdPlanoPrev)+' AS IDPLANOPREV, '+
                       PreparaStrRegra(qryBeneficio.FieldByName('IdBeneficio').AsString)+' AS IDBENEFICIO  '+
           ' FROM DUAL ';

  bOpcaoValida := RegraBooleana(qryBeneficio.FieldByName('IDREGRAVALIDAOPTEXTO2').AsString,
                                sSQL, bErro);

  if bErro
  then begin
    MsgDlg('Ocorreu um erro na Regra de Validação da Opção de Texto : '+lblOpcaoTexto2.Caption +
           'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk,mbHelp],0);
    edtCampoTexto2.Text := '';
  end
  else begin
    if not bOpcaoValida
    then begin
       MsgDlg('O texto '+edtCampoTexto2.Text+ ' foi considerado inválido pela Regra de Validação da Opção de Texto '+lblOpcaoTexto2.Caption,
              'Erro',mtError,[mbOk,mbHelp],0);
       edtCampoTexto2.Text := '';
    end;
  end;
end;

procedure TfrmCadOpcoesBenef.edtCampoTexto3Exit(Sender: TObject);
var sSQL, sOpcao : string;
    bErro,
    bOpcaoValida : boolean;
begin
  inherited;
   // Executar regra de validacao da opcao
  if (qryBeneficio.IsEmpty) or
     (Trim(qryBeneficio.FieldByName('IDREGRAVALIDAOPTEXTO3').AsString) = '') or
     (Trim(edtCampoTexto3.Text) = '')
  then Exit;

  sOpcao := Trim(edtCampoTexto3.Text);
  sSQL :=  '  SELECT '+QuotedStr(PreparaStrRegra(sOpcao))+' AS CAMPOTEXTO,  '+
                       QuotedStr(PreparaStrRegra(sOpcao))+' AS CAMPOTEXTO3, '+
                       IntToSTr(ilIdPlanoPrev)+' AS IDPLANOPREV, '+
                       PreparaStrRegra(qryBeneficio.FieldByName('IdBeneficio').AsString)+' AS IDBENEFICIO  '+
           ' FROM DUAL ';

  bOpcaoValida := RegraBooleana(qryBeneficio.FieldByName('IDREGRAVALIDAOPTEXTO3').AsString,
                                sSQL, bErro);

  if bErro
  then begin
    MsgDlg('Ocorreu um erro na Regra de Validação da Opção de Texto : '+lblOpcaoTexto3.Caption +
           'A opção será considerada inválida até que a regra seja acertada.','Erro',mtError,[mbOk,mbHelp],0);
    edtCampoTexto3.Text := '';
  end
  else begin
    if not bOpcaoValida
    then begin
       MsgDlg('O texto '+edtCampoTexto3.Text+ ' foi considerado inválido pela Regra de Validação da Opção de Texto '+lblOpcaoTexto3.Caption,
              'Erro',mtError,[mbOk,mbHelp],0);
       edtCampoTexto3.Text := '';
    end;
  end;
end;


procedure TfrmCadOpcoesBenef.edtCampoTexto1BtnClick(Sender: TObject);
var  rOpcao : String;
begin
  inherited;
   // Executar regra de calculo da opcao
  if (qryBeneficio.IsEmpty) or
     (Trim(qryBeneficio.FieldByName('IDREGRACALCOPTEXTO1').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcaoTexto(qryBeneficio.FieldByName('IDREGRACALCOPTEXTO1').AsInteger,
                         'OPCAOTEXTO1',
                         'Opção de Texto 2');
  edtCampoTexto1.Text  := rOpcao;
end;


procedure TfrmCadOpcoesBenef.edtCampoTexto2BtnClick(Sender: TObject);
 var  rOpcao : String;
begin
  inherited;
   // Executar regra de calculo da opcao
  if (qryBeneficio.IsEmpty) or
     (Trim(qryBeneficio.FieldByName('IDREGRACALCOPTEXTO2').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcaoTexto(qryBeneficio.FieldByName('IDREGRACALCOPTEXTO2').AsInteger,
                         'OPCAOTEXTO2',
                         'Opção de Texto 2');
  edtCampoTexto2.Text  := rOpcao;
end;

procedure TfrmCadOpcoesBenef.edtCampoTexto3BtnClick(Sender: TObject);
var  rOpcao : String;
begin
  inherited;
   // Executar regra de calculo da opcao
  if (qryBeneficio.IsEmpty) or
     (Trim(qryBeneficio.FieldByName('IDREGRACALCOPTEXTO3').AsString) = '')
  then Exit;

  rOpcao := CalculaOpcaoTexto(qryBeneficio.FieldByName('IDREGRACALCOPTEXTO3').AsInteger,
                         'OPCAOTEXTO3',
                         'Opção de Texto 3');
  edtCampoTexto3.Text  := rOpcao;

end;
function TfrmCadOpcoesBenef.CalculaOpcaoTexto(piIdRegraCalculo : longint;
                                         sCampo,                 
                                         sTitulo : string
                                         ) : String;
var
    rOpcao, rOpcao1, rOpcao2, rOpcao3 : double;
    bErro  : boolean;
    sMsgErro,sValorOpcao, rOpcaoTexto1, rOpcaoTexto2, rOpcaoTexto3 : string;
begin
  inherited;
  sValorOpcao := '';
  if not qryBeneficio.Active
  then begin
   qryBeneficio.Close;
   qryBeneficio.ParamByName('IdPlanoPrev').AsInteger := ilIdPlanoPrev;
   qryBeneficio.ParamByName('IdBeneficio').AsInteger := ilIdBeneficio;
   qryBeneficio.Open;
  end;

  Result := '';
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

  rOpcaoTexto1 := Trim(edtCampoTexto1.Text);
  rOpcaoTexto2 := Trim(edtCampoTexto2.Text);
  rOpcaoTexto3 := Trim(edtCampoTexto3.Text);

  frmAguarde.Mostra('Regra de Cálculo da '+sTitulo+' do Benefício - Nº '+IntToStr(piIdRegraCalculo));

  qryPart.Close;
  qryPart.ParamByName('IdPessoa').Value    := ilIdPessoa;
  qryPart.ParamByName('IdPlanoPrev').Value := ilIdPlanoPrev;
  qryPart.ParamByName('IdPessJur').Value   := ilIdPessJur;
  qryPart.Open;

  try

       sValorOpcao := ExecutaRegraCalculoOpcaoTextoBenef(qryAux,
                                               piIdRegraCalculo,
                                               qryBeneficio.FieldByName('IdRegraPagamento').AsInteger,
                                               ilIdPessJur, ilIdPlanoPrev, ilIdPessoa,ilSeqProposta,
                                               qryBeneficio.FieldByName('IdBeneficio').AsInteger,
                                               ilNumeroProcesso,
                                               qryPart.FieldByName('IdSitFunc').AsInteger,
                                               qryPart.FieldByName('IdSitPart').AsInteger,
                                               qryPart.FieldByName('IdSitPlanoPrev').AsInteger,
                                               rOpcao1, rOpcao2, rOpcao3,
                                               slDataEvento,
                                               slDataInicio,
                                               slDataInicioINSS,
                                               slVlrInfINSS,
                                               slDataRequerimento,
                                               slValorCalcINSS,
                                               slValorBase1INSS,
                                               slValorBase2INSS,
                                               slValorBase3INSS,
                                               bErro,
                                               sMsgErro,
                                               iIdCalculoGeral,
                                               slFlgInternoAntes ,
                                               slFlgInternoAtual ,
                                               slIdSitPartAntes  ,
                                               slIdSitPlanAntes  ,
                                               slIdSitFuncAntes  ,
                                               slIdSitPartAtual  ,
                                               slIdSitPlanAtual  ,
                                               slIdSitFuncAtual,
                                               sValorSRB,
                                               rOpcaoTexto1,
                                               rOpcaoTexto2,
                                               rOpcaoTexto3);


  except
     frmAguarde.Apaga;
  end;

  qryPart.Close;
  qryAux.Close;
  frmAguarde.Apaga;

  if bErro then
  begin
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
    TiraSQL(qryAux);
    Exit;
  end
  else
    Result := sValorOpcao
end;


end.
