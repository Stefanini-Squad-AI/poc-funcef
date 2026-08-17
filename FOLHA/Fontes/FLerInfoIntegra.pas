{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FLerInfoIntegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TB97, ComCtrls,
  CMTree, Mask, wwdblook,Wwquery,DBTables, Wwdatsrc, Db, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, CMProcuraMask, MontaSelect,
  DIntegracao, UAutorizacao, USistema, UMensErro, UModulo, uIntegraBack,
  {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF};

type
  TfrmLerInfoIntegra = class(TfrmOkCancelar)
    pgctrlIntegracao: TPageControl;
    tbsOutros: TTabSheet;
    pnlFundoOutros: TPanel;
    pnlGlobContab: TPanel;
    lblcentrespon: TLabel;
    cmbcentrespon: TwwDBLookupCombo;
    StaticText2: TStaticText;
    tbsContab: TTabSheet;
    pnlFundoContab: TPanel;
    grpContaAssoc: TGroupBox;
    Label3: TLabel;
    cmbCCusto: TwwDBLookupCombo;
    GroupBox3: TGroupBox;
    lbDescricaoCCusto: TLabel;
    tbsCAPCAR: TTabSheet;
    pnlFundoCAPCAR: TPanel;
    Panel1: TPanel;
    lblPlano: TLabel;
    lblProvento: TLabel;
    lbAtividade: TLabel;
    lkcmbDescAtividade: TwwDBLookupCombo;
    lblContasCaixas: TLabel;
    dblkpcmbPortForma: TwwDBLookupCombo;
    cmContaAssoc: TCMProcuraMaskContabil;
    qryTipoDesemb: TwwQuery;
    msTipoDesemb: TMontaSelect;
    cmpmTipoDesDesc: TCMProcuraMask;
    cmpmTipoDesFavo: TCMProcuraMask;
    Panel2: TPanel;
    Label43: TLabel;
    dblkSubconta: TwwDBLookupCombo;
    StaticText1: TStaticText;
    tbsCAR: TTabSheet;
    cmpmTipoRecebCar: TCMProcuraMask;
    cmpmTipoRecebFavCar: TCMProcuraMask;
    qryTipoReceb: TwwQuery;
    msTipoReceb: TMontaSelect;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure cmbCCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbcentresponExit(Sender: TObject);
    procedure lkcmbDescAtividadeExit(Sender: TObject);
    procedure dblkpcmbPortFormaExit(Sender: TObject);
    procedure cmbCCustoExit(Sender: TObject);
    procedure cmpmTipoDesDescExit(Sender: TObject);
    procedure cmpmTipoDesFavoExit(Sender: TObject);
    procedure dblkSubcontaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function TiraPontos( Valor  : String) : String;
    procedure cmContaAssocExit(Sender: TObject);
    procedure cmContaAssocChange(Sender: TObject);
    procedure cmpmTipoRecebCarExit(Sender: TObject);
    procedure cmpmTipoRecebFavCarExit(Sender: TObject);

  private
    { Private declarations }
    bUsaABC, bUsaCRespon: boolean;
    procedure PreparaIntegracao;
    procedure FazQryCCusto;
    procedure FazQryCCusto1; 

  public
    { Public declarations }
    iIdPlanoPrev,  iSpdConta , iFlgDesconto , iObrigaFavorec ,ispdDesconto: integer;
    // Variaveis do CAPCAR e Contabilidade
    sCodCentroRespon, sIdPessoa, sCodPortForma, sSubConta,
    sCodTipRecDes, sRecPag, sUnidNegoc, sIdEmpresaProp,sCodTipRecDesFav,
    sCodTipRecDesCar, sCodTipRecDesFavCar,sIdEmpresa, sCodCentroCustoC,
    sCodCentroCustoD, sPlano, sPlaContaC, sPlaContaD, edCodRecDesFavorec,
    edCodRecDesDesconto: string;
    bOk : boolean;
  end;

var
  frmLerInfoIntegra: TfrmLerInfoIntegra;

implementation

uses dBaseDados, FAssocRubricaPlano, uAdmPrevFB;

{$R *.DFM}

procedure TfrmLerInfoIntegra.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  with dtmIntegracao do begin
       If cmbcentrespon.Enabled = True Then
       Begin
         If (cmbcentrespon.Text <> '') Then
           sCodCentroRespon := qryCentRespon.FieldByName('CodCentroRespon').AsString
         Else
         Begin
           MsgDlg('O preenchimento do campo Centro de Responsabilidade é obrigatório.', 'Informação', mtInformation, [mbOk], 0);
           ModalResult := mrNone;
           Exit;
         End;
       End
       Else
         sCodCentroRespon := prmCodCentroRespon;

       If iObrigaFavorec = 1 Then
       Begin
         If (dblkpcmbPortForma.Text <> '') Then
           sCodPortForma := qryFormaPag.FieldByName('CodPortForma').AsString
         Else
         Begin
           MsgDlg('O preenchimento do campo Contas Caixas x Forma de Pagto é obrigatório.', 'Informação', mtInformation, [mbOk], 0);
           ModalResult := mrNone;
           Exit;
         End;
       End;

       If frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDES').AsString <> '' Then
       Begin
         sCodTipRecDes :=  frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDES').AsString;
         sRecPag       := 'P';
       End
       Else
         sCodTipRecDes := '';

       If frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDESFAV').AsString <> '' Then
       Begin
         sCodTipRecDesFav :=  frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDESFAV').AsString;
         sRecPag          := 'P';
       End
       Else
         sCodTipRecDesFav := '';

       If frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDESCAR').AsString <> '' Then
         sCodTipRecDesCar :=  frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDESCAR').AsString
       Else
         sCodTipRecDesCar := '';

       If frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDESFAVCAR').AsString <> '' Then
         sCodTipRecDesFavCar :=  frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDESFAVCAR').AsString
       Else
         sCodTipRecDesFavCar := '';

       If lkcmbDescAtividade.Enabled = True Then
       Begin
         If (lkcmbDescAtividade.Text <> '') Then
           sUnidNegoc := qryAtividade.FieldByName('UnidNegoc').AsString
         Else
         Begin
           MsgDlg('O preenchimento do campo Atividade/Projeto é obrigatório.', 'Informação', mtInformation, [mbOk], 0);
           ModalResult := MrNone;
           Exit;
         End;
       End
       Else
         sUnidNegoc := IntToStr(prmUnidNegoc);

       If (dblkSubConta.Text <> '') Then
         sSubConta := qrySubConta.FieldByName('CODSUBCONTA').AsString
       Else
         sSubConta := '';

       If iFlgDesconto = 0 Then
       Begin
         If (cmbCCusto.Text <> '') Then
         Begin
           sCodCentroCustoC := qryCCusto.FieldByName('CodCentroCusto').AsString;
           sIdEmpresa       := qryCCusto.FieldByName('IdEmpresa').AsString;
         End
         Else
           sCodCentroCustoC := '';
       End
       Else
       Begin
         // Pega dados CCustoReceber
         If (cmbCCusto.Text <> '') Then
         Begin
           sCodCentroCustoD := qryCCusto.FieldByName('CodCentroCusto').AsString;
           sIdEmpresa       := qryCCusto.FieldByName('IdEmpresa').AsString;
         End
         Else
           sCodCentroCustoD := '';
       End;

       if (cmbCCusto.Text = '') then sIdEmpresa := '';

       If iFlgDesconto = 1 Then begin
         If (cmContaAssoc.Valida = VcOK) then begin
           If TiraPontos(cmContaAssoc.Conta.Numero) <> '' then begin
             sPlaContaC := TiraPontos(cmContaAssoc.Conta.Numero);
             sPlano     := IntToStr(IntegraBack.Plano);
           end else sPlaContaC := '';
         end;
       end else begin
         if (cmContaAssoc.Valida = VcOK) then begin
           if TiraPontos(cmContaAssoc.Conta.Numero) <> '' then begin
             sPlaContaD := TiraPontos(cmContaAssoc.Conta.Numero);
             sPlano     := IntToStr(IntegraBack.Plano);
           end else sPlaContaD := '';
         end;
       end;

       If (cmContaAssoc.Valida <> VcOK) then sPlano := '';

       if (lkcmbDescAtividade.Text <> '') or
          (frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDESFAV').AsString <> '') or
          (frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDES').AsString <> '') or
          (frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDESCAR').AsString <> '') or
          (frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDESFAVCAR').AsString <> '') or
          (cmbcentrespon.Text <> '') Then
           sIdEmpresaProp := InttoStr(Sistema.IdEmpresa)
       else if (lkcmbDescAtividade.Text = '') and
          (frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDESFAV').AsString = '') and
          (frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDES').AsString = '') and
          (frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDESCAR').AsString = '') and
          (frmAssocRubricaPlano.qryTemporaria.FieldByName('CODTIPRECDESFAVCAR').AsString = '') and
          (cmbcentrespon.Text = '') Then
           sIdEmpresaProp := '';
  end;
  ModalResult := mrOk;
  bOk         := True;
  Close;

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Associação de rubricas por plano.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;
end; // bbtnConfirmarClick

procedure TfrmLerInfoIntegra.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
  bOk := False;
  Close;
end; // bbtnCancelarClick

procedure TfrmLerInfoIntegra.PreparaIntegracao;
var
  VarFields : variant;
begin
  // Limpar campos da tela
  VarFields:=VarArrayCreate([0,1], varVariant);
    
  dblkpcmbPortForma.Enabled   := False;
  pgctrlIntegracao.ActivePage := tbsContab;

  cmpmTipoDesFavo.Enabled := False;
  if iFlgDesconto = 1 Then
  Begin              {Descontos}
    cmpmTipoDesDesc.Caption := 'Tipo de Desembolso para desconto no Contas a Pagar da Folha';
    cmpmTipoRecebCar.Caption:= 'Tipo de Recebimento para Rateio (Estorno de Pagamento)';

    grpContaAssoc.Caption   := 'Conta de Receita';
    cmContaAssoc.DataField  := 'PLACONTAC';

    {Desconto => Receita ou Passivo quando iObrigaFavorec = 1}
    if iObrigaFavorec = 1 Then
    Begin
      dblkpcmbPortForma.Enabled   := True;
      pgctrlIntegracao.ActivePage := tbsOutros;
      cmpmTipoDesFavo.Enabled     := True;
      grpContaAssoc.Caption       := 'Conta de Passivo';
    end;
  end
  else
  Begin                                  {Proventos}
    cmpmTipoDesDesc.Caption := 'Tipo de Desembolso para rateio do Contas a Pagar da Folha';
    cmpmTipoRecebCar.Caption:= 'Tipo de Recebimento para Devolução na Folha';
    cmContaAssoc.DataField  := 'PLACONTAD';
    grpContaAssoc.Caption   := 'Conta de Despesa';

    //HABILITAR QUANDO RUBRICA OBRIGA FAVORECIDO
    if iObrigaFavorec = 1 Then
    Begin
      dblkpcmbPortForma.Enabled   := True;
      pgctrlIntegracao.ActivePage := tbsOutros;
      cmpmTipoDesFavo.Enabled     := True;
    end;
  end;
  qryTipoDesemb.Close;
  qryTipoReceb.Close;
  cmpmTipoDesDesc.Mascara := IntegraBack.MascaraDesemb;
  cmpmTipoDesFavo.Mascara := IntegraBack.MascaraDesemb;
  cmpmTipoRecebCar.Mascara := IntegraBack.MascaraDesemb;
  cmpmTipoRecebFavCar.Mascara := IntegraBack.MascaraDesemb;

  msTipoDesemb.Filtro.Add('TIPORECEBDESEMB.IDPESSOA = '+IntToStr(Sistema.idEmpresa));
  msTipoDesemb.Filtro.Add('TIPORECEBDESEMB.RECPAG = ''P''');
  msTipoDesemb.Filtro.Add('TIPORECEBDESEMB.ANASINT = ''A''');
  msTipoReceb.Filtro.Add('TIPORECEBDESEMB.IDPESSOA = '+IntToStr(Sistema.idEmpresa));
  msTipoReceb.Filtro.Add('TIPORECEBDESEMB.RECPAG = ''R''');
  msTipoReceb.Filtro.Add('TIPORECEBDESEMB.ANASINT = ''A''');

  with dtmintegracao do
  Begin
    if (sSubConta <> '') and
       (QrySubConta.Locate('CODSUBCONTA',sSubConta,[])) then
      dblkSubconta.Text := QrySubConta.FieldbyName('NOMESUBCONTA').AsString;

    if (sCodPortForma <> '') and
       (qryFormaPag.Locate('CODPORTFORMA',sCodPortForma,[loCaseInsensitive,loPartialKey])) then
      dblkpcmbPortForma.Text := qryFormaPag.FieldByName('Descricao').AsString;

    If IntegraBack.ObrigaABC = 'N' Then
    Begin
      lkcmbDescAtividade.Enabled := false;
      bUsaABC := false;
    End
    Else
    Begin
      bUsaABC := true;
      lkcmbDescAtividade.Enabled := true;
      If (sUnidNegoc <> '') and
         (qryAtividade.Locate('UnidNegoc', sUnidNegoc , [loCaseInsensitive,loPartialKey])) then
        lkcmbDescAtividade.Text := qryAtividade.FieldByName('Nome').AsString;
    End;

    if IntegraBack.ObrigaCRespon = 'N' then
    begin
      cmbcentrespon.Enabled := false;
      bUsaCRespon := false;
    end
    else
    begin
      bUsaCRespon := true;
      cmbcentrespon.Enabled := true;
      if (sCodCentroRespon <> '') and
         (qryCentRespon.Locate('CodCentroRespon',sCodCentroRespon,[loCaseInsensitive,loPartialKey])) then
        cmbcentrespon.Text := qryCentRespon.FieldByName('Nome').AsString;
    end;

    //Renato Visoni SOL 100904 \ KINTANA 447227
    FazQryCCusto;
    FazQryCCusto1;
    //Fim

    If iFlgDesconto = 0 Then
    Begin
      If (sCODCENTROCUSTOC <> '') And (qryCCusto.active) Then
      Begin
        qryCCusto.Locate('CODCENTROCUSTO' ,sCODCENTROCUSTOC, [loPartialKey]);
        cmbCCusto.text := qryCCusto.fieldbyname('nome').AsString;
        lbDescricaoCCusto.Caption := qryCCusto.FieldByName('Nome').AsString;
      End;
    End
    Else
    Begin
      If (sCODCENTROCUSTOD <> '') And (qryCCusto.active) Then
      Begin
        qryCCusto.Locate('CODCENTROCUSTO' ,sCODCENTROCUSTOD, [loPartialKey]);
        cmbCCusto.text := qryCCusto.fieldbyname('nome').AsString;
        lbDescricaoCCusto.Caption := qryCCusto.FieldByName('Nome').AsString;
      End;
    End;
  end;// with

end; // PreparaIntegracao

procedure TfrmLerInfoIntegra.cmbCCustoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  lbDescricaoCCusto.Caption := LookupTable.FieldByName('Nome').AsString;
end; // cmbCCustoCloseUp

procedure TfrmLerInfoIntegra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dtmIntegracao do begin
    qryTpReceb.Close;
    qryCCusto.Close;
    qryAtividade.Close;
    qryformapag.Close;
    qrycentrespon.Close;
    qrySubConta.Close;
  end;
  qryTipoDesemb.Close;
  qryTipoReceb.Close;
end; // FormClose

procedure TfrmLerInfoIntegra.cmbcentresponExit(Sender: TObject);
begin
  inherited;
  if cmbcentrespon.Text = ''
  then sCodCentroRespon := '';
end; // cmbcentresponExit

procedure TfrmLerInfoIntegra.lkcmbDescAtividadeExit(Sender: TObject);
begin
  inherited;
  if lkcmbDescAtividade.Text = ''
  then sUnidNegoc := '';
end; // lkcmbDescAtividadeExit

procedure TfrmLerInfoIntegra.dblkpcmbPortFormaExit(Sender: TObject);
begin
  inherited;
  if dblkpcmbPortForma.Text = ''
  then sCodPortForma := '';
end; // dblkpcmbPortFormaExit

procedure TfrmLerInfoIntegra.cmbCCustoExit(Sender: TObject);
begin
  inherited;
  If cmbCCusto.Text = '' Then sCodCentroCustoC := '';
end; // cmbCCustoExit

procedure TfrmLerInfoIntegra.cmpmTipoDesDescExit(Sender: TObject);
begin
  inherited;
  if (cmpmTipoDesDesc.Valida <> VcOK) and (ActiveControl.Tag <> 99) then
     exit;
end;

procedure TfrmLerInfoIntegra.cmpmTipoDesFavoExit(Sender: TObject);
begin
  inherited;
  if (cmpmTipoDesFavo.Valida <> VcOK) and (ActiveControl.Tag <> 99) then
     exit;
end;

procedure TfrmLerInfoIntegra.dblkSubcontaExit(Sender: TObject);
begin
  inherited;
  if dblkSubConta.Text = '' then
     sSubConta := '';
end;

procedure TfrmLerInfoIntegra.FormShow(Sender: TObject);
begin
  inherited;
  dtmIntegracao.qryFormaPag.Close;
  dtmIntegracao.qryFormaPag.Open;
  dtmIntegracao.qryAtividade.Close;
  dtmIntegracao.qryAtividade.ParamByName('IDEMPRESA').AsString := IntToStr(sistema.idEmpresa);
  dtmIntegracao.qryAtividade.Open;
  dtmIntegracao.qryCentRespon.Close;
  dtmIntegracao.qryCentRespon.Open;
  dtmIntegracao.qrySubConta.close;
  dtmIntegracao.qrySubConta.Open;
  PreparaIntegracao;
end;

function TfrmLerInfoIntegra.TiraPontos( Valor  : String) : String;
var
   i : LongInt;
begin
     i := Pos('.', Valor);
     while i > 0 do begin
           Valor := Copy(Valor,1,i-1)+Copy(Valor,i+1,Length(Valor));
           i := Pos('.', Valor);
     end;
     Result := Valor;
     
end;

procedure TfrmLerInfoIntegra.cmContaAssocExit(Sender: TObject);
Var
  ssql : String;

begin
  inherited;
  If (ActiveControl.Tag <> 99) Then Begin
    If iFlgDesconto = 1 Then Begin 
      If cmContaAssoc.Valida = VcOK Then Begin
        If cmContaAssoc.Conta.ObrigaCentrodeCusto Then Begin
          cmContaAssocChange(Self); 
        End;
      End;
    End Else Begin 
      If cmContaAssoc.Valida = VcOK Then Begin
        If cmContaAssoc.Conta.ObrigaCentrodeCusto Then Begin
          cmContaAssocChange(Self); 
        End;
      End;
    End;
  End;
end;

procedure TfrmLerInfoIntegra.FazQryCCusto;
Var
  sSql : String;

begin
  With dtmIntegracao Do Begin
    qryCCusto.Close;
    qryCCusto.SQL.Clear;
    sSql := 'SELECT C.IDEMPRESA,C.CODCENTROCUSTO,C.NOME FROM CENTCUST C, CONTASxCC CC '+
            'WHERE CC.IDEMPRESA = '+ InttoStr(sistema.idEmpresa) +
            ' AND CC.PLANO = ' + InttoStr(IntegraBack.Plano) +
            ' AND CC.PLACONTA = '''+ TiraPontos(cmContaAssoc.Conta.Numero) + ''''+
            ' AND (CC.CODCENTROCUSTO = C.CODCENTROCUSTO) AND (CC.IDEMPRESA = C.IDEMPRESA)';
    qryCCusto.Sql.Add(sSql);
    qryCCusto.Open;
    cmbCCusto.Enabled := True;
  End;
end;

procedure TfrmLerInfoIntegra.FazQryCCusto1;
Var
  sSql : String;

begin
  With dtmIntegracao Do Begin
    qryCCusto.Close;
    qryCCusto.SQL.Clear;
    sSql := 'SELECT C.IDEMPRESA,C.CODCENTROCUSTO,C.NOME FROM CENTCUST C, CONTASxCC CC '+
            'WHERE CC.IDEMPRESA = '+ InttoStr(sistema.idEmpresa) +
            ' AND CC.PLANO = ' + InttoStr(IntegraBack.Plano) +
            ' AND CC.PLACONTA = '''+ TiraPontos(cmContaAssoc.Conta.Numero) + ''''+
            ' AND (CC.CODCENTROCUSTO = C.CODCENTROCUSTO) AND (CC.IDEMPRESA = C.IDEMPRESA)';
    qryCCusto.Sql.Add(sSql);
    qryCCusto.Open;
    cmbCCusto.Enabled := True;
  End;
end;

procedure TfrmLerInfoIntegra.cmContaAssocChange(Sender: TObject);
begin
  inherited;
  FazQryCCusto;
  FazQryCCusto1;
end;

procedure TfrmLerInfoIntegra.cmpmTipoRecebCarExit(Sender: TObject);
begin
  inherited;
  if (cmpmTipoRecebCar.Valida <> VcOK) and (ActiveControl.Tag <> 99) then
     exit;
end;

procedure TfrmLerInfoIntegra.cmpmTipoRecebFavCarExit(Sender: TObject);
begin
  inherited;
  if (cmpmTipoRecebFavCar.Valida <> VcOK) and (ActiveControl.Tag <> 99) then
     exit;
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|==============================================================================|
 Desenvolvedor: Renato Visoni                                                 |
 Data : 11/11/2008
 Pendencia : SOL 100904 \ KINTANA 447227
 Descrição: O sistema não estava listando o Centro De Custo, pois quando as
 funçoes FazQryCCusto e FazQryCCusto1 estavam sendo chamadas a variavel de
 conta contabil estava em branco
--------------------------------------------------------------------------------
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/07/2002 A 23/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    -  Foram colocadas duas procedures, "FazQryCCusto", "FazQryCCusto1"       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/07/2002 A 31/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    -  Foi trocado na procedure preparaintegração, o datafield do componente  |
|    cmContaAssoc e no evento click do botão confirmar foi trocado os valores  |
|    que as variáveis sPlaContaC e sPlaContaD recebiam.                        |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/12/2002 A 19/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF) - Pendência 10599.                                         |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Criação  da  aba Contas a Receber com o uso de   |
|   dois TCMProcuraMask para receber a parametrização de dois campos criados   |
|   na tabela RubricaxPlano (CODTIPRECDESCAR, CODTIPRECDESFAVCAR).             |
| Alteração para gravar dois novos campos na tabela RubricaxPlano que sâo:     |
|  (CODTIPRECDESCAR, CODTIPRECDESFAVCAR).                                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/12/2002 A 30/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Quando estiver parametrizado para não utilizar Atividade e Projeto,     |
|    colocar no campo UnidNegoc da tabela RubricaxPlano a Atividade e Projeto  |
|    padrão.                                                                   |
|                                                                              |
|    - Tornei obrigatório, os campos desse form que eram testados no evento    |
|    click do botão OK.                                                        |
|                                                                              |
|    - Pendência 10828.                                                        |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

