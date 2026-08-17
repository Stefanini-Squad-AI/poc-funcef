// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
//  Autor(a)   : Paulo Ramos
//  Rotina     : form
//  Data       : 07.12.2005
//  Pendencia  : 20952
//  Alteração  : Inibir os botões de Inserir e Excluir.
// -------------------------------------------------------------------------------------------------
unit FAcertaParamContabilFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  CMProcuraMask, wwdblook, uIntegraBack, dIntegracao, uSistema, uMensErro,
  uAdmPrevFB, uCMTypes, dBaseDados, Mask, wwdbedit;

type
  TFrmAcertaParamContabilFinanc = class(TFrmCadastroGridCS)
    dblkCentRespon: TwwDBLookupCombo;
    Label3: TLabel;
    btnBuscaDados: TBitBtn;
    Label1: TLabel;
    dblkSubConta: TwwDBLookupCombo;
    qryCCusto: TwwQuery;
    qryCentRespon: TwwQuery;
    qrySubConta: TwwQuery;
    qryTipoDesemb: TwwQuery;
    msTipoDesemb: TMontaSelect;
    qryRub: TwwQuery;
    qryAtualiza: TwwQuery;
    qryTmp: TwwQuery;
    dsTmp: TwwDataSource;
    cmpmTipoDesDesc: TCMProcuraMask;
    grpContaAssoc: TGroupBox;
    Label2: TLabel;
    cmbCCusto: TwwDBLookupCombo;
    GroupBox3: TGroupBox;
    lbDescricaoCCusto: TLabel;
    cmContaAssoc: TCMProcuraMaskContabil;
    updTmp: TUpdateSQL;
    lblPatro: TLabel;
    dbEdtPatro: TwwDBEdit;
    lblPlano: TLabel;
    dbEdtPlano: TwwDBEdit;
    dbEdtCodRub: TwwDBEdit;
    lblCodRubrica: TLabel;
    lblDescrRubrica: TLabel;
    dbEdtDescrRubrica: TwwDBEdit;
    procedure CmeCadastroFind(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure cmContaAssocChange(Sender: TObject);
    procedure cmContaAssocExit(Sender: TObject);
    procedure btnBuscaDadosClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure PreparaIntegracao;
    procedure LimpaComponentes;
    function TiraPontos( Valor  : String) : String;
  public
    { Public declarations }
    iFlgDesconto, iObrigaFavorec: Integer;
    sSubConta, sCodPortForma, sCodCentroRespon,
    sCodCentroCustoC, sCodCentroCustoD, sPlaContaC,
    sPlaContaD, sPlano, sCodTipRecDes, sIdLote: String;
    bUsaCRespon, bClickAlt : Boolean;
  end;

var
  FrmAcertaParamContabilFinanc: TFrmAcertaParamContabilFinanc;

implementation

{$R *.DFM}

procedure TFrmAcertaParamContabilFinanc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    qry.Close;
    qry.ParamByName('PIDLOTE').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;
    sIdLote := MontaSelect.ValoresChave[0];
  End;
end;

procedure TFrmAcertaParamContabilFinanc.PreparaIntegracao;
begin
  If iFlgDesconto = 1 Then
  Begin {Descontos}
    cmpmTipoDesDesc.Caption    := 'Tipo de Desembolso para desconto no Contas a Pagar da Folha';
    grpContaAssoc.Caption      := 'Conta de Receita';
    cmContaAssoc.DataField     := 'PLACONTAC';
    cmContaAssoc.DataSource    := ds;
    cmpmTipoDesDesc.DataSource := ds;

    {Desconto => Receita ou Passivo quando iObrigaFavorec = 1}
    If iObrigaFavorec = 1 Then
      grpContaAssoc.Caption := 'Conta de Passivo';
  End
  Else
  Begin {Proventos}
    cmpmTipoDesDesc.Caption    := 'Tipo de Desembolso para rateio do Contas a Pagar da Folha';
    grpContaAssoc.Caption      := 'Conta de Despesa';
    cmContaAssoc.DataField     := 'PLACONTAD';
    cmContaAssoc.DataSource    := ds;
    cmpmTipoDesDesc.DataSource := ds;
  End;
  qryTipoDesemb.Close;
  cmpmTipoDesDesc.Mascara := IntegraBack.MascaraDesemb;
  msTipoDesemb.Filtro.Add('T.IDPESSOA = '+IntToStr(Sistema.idEmpresa));
  msTipoDesemb.Filtro.Add('T.RECPAG = ''P''');
  msTipoDesemb.Filtro.Add('T.ANASINT = ''A''');
  If (sSubConta <> '') And (QrySubConta.Locate('CODSUBCONTA', sSubConta, [])) Then
    dblkSubconta.Text := QrySubConta.FieldbyName('NOMESUBCONTA').AsString;

  If IntegraBack.ObrigaCRespon = 'N' Then
  Begin
    dblkCentRespon.Enabled := False;
    bUsaCRespon            := False;
  End
  Else
  Begin
    dblkCentRespon.Enabled := True;
    bUsaCRespon            := True;
    If (sCodCentroRespon <> '') And (qryCentRespon.Locate('CodCentroRespon', sCodCentroRespon, [loCaseInsensitive, loPartialKey])) Then
      dblkCentRespon.Text := qryCentRespon.FieldByName('Nome').AsString;
  End;

  If iFlgDesconto = 0 Then
  Begin
    If (sCodCentroCustoC <> '') And (qryCCusto.Active) Then
    Begin
      qryCCusto.Locate( 'CODCENTROCUSTO', qry.FieldByName('CODCENTROCUSTOC').AsString, [loPartialKey]);
      cmbCCusto.Text            := qryCCusto.FieldByName('Nome').AsString;
      lbDescricaoCCusto.Caption := qryCCusto.FieldByName('Nome').AsString;
    End;
  End
  Else
  Begin
    If (sCodCentroCustoD <> '') And (qryCCusto.Active) Then
    Begin
      qryCCusto.Locate( 'CODCENTROCUSTO', qry.FieldByName('CODCENTROCUSTOD').AsString, [loPartialKey]);
      cmbCCusto.Text            := qryCCusto.FieldByName('Nome').AsString;
      lbDescricaoCCusto.Caption := qryCCusto.FieldByName('Nome').AsString;
    End;
  End;
end;

procedure TFrmAcertaParamContabilFinanc.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryRub.Close;
  qryRub.ParamByName('PIDPROVENTO').AsInteger := qry.FieldByName('IDPROVENTO').AsInteger;
  qryRub.Open;
  iFlgDesconto   := qryRub.FieldByName('FLGDESCONTO').AsInteger;
  iObrigaFavorec := qryRub.FieldByName('FLGOBRIGAFAVOREC').AsInteger;
  qryCCusto.Close;
  qryCCusto.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryCCusto.ParamByName('PPLANO').AsInteger    := IntegraBack.Plano;
  qryCCusto.ParamByName('PPLACONTA').AsString  := TiraPontos(cmContaAssoc.Conta.Numero);
  qryCCusto.Open;
  If Trim(qry.FieldByName('CODCENTRORESPON').AsString) <> '' Then
    qryCentRespon.Locate( 'CODCENTRORESPON', qry.FieldByName('CODCENTRORESPON').AsString, []);

  If Trim(qry.FieldByName('CODSUBCONTA').AsString) <> '' Then
    qrySubConta.Locate( 'CODSUBCONTA', qry.FieldByName('CODSUBCONTA').AsString, []);
end;

function TFrmAcertaParamContabilFinanc.TiraPontos( Valor  : String) : String;
Var
  I : LongInt;

begin
  I := Pos('.', Valor);
  While I > 0 Do
  Begin
    Valor := Copy(Valor,1, I - 1) + Copy(Valor, I + 1, Length(Valor));
    I     := Pos('.', Valor);
  End;
  Result := Valor;
end;

procedure TFrmAcertaParamContabilFinanc.FormShow(Sender: TObject);
begin
  inherited;
  qryCentRespon.Open;
  qrySubConta.Open;
end;

procedure TFrmAcertaParamContabilFinanc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrySubConta.Close;
  qryCentRespon.Close;
end;

procedure TFrmAcertaParamContabilFinanc.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  qryTmp.Close;
  qryTmp.ParamByName('IdPessJur').AsInteger   := qry.FieldByName('IDPESSJUR').AsInteger;
  qryTmp.ParamByName('IdRubrica').AsInteger   := qry.FieldByName('IDPROVENTO').AsInteger;
  qryTmp.ParamByName('IdPlanoPrev').AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger;
  qryTmp.Open;
  qryTmp.Edit;
  If Trim(qry.FieldByName('CODSUBCONTA').AsString) <> '' Then
    sSubConta := qry.FieldByName('CODSUBCONTA').AsString
  Else
    sSubConta := '';

  If Trim(qry.FieldByName('CODCENTRORESPON').AsString) <> '' Then
    sCodCentroRespon := qry.FieldByName('CODCENTRORESPON').AsString
  Else
    sCodCentroRespon := '';

  cmContaAssoc.Mascara := IntegraBack.MascaraPlano;
  cmContaAssoc.Plano   := IntegraBack.Plano;
  PreparaIntegracao;
end;

procedure TFrmAcertaParamContabilFinanc.cmContaAssocChange(
  Sender: TObject);
Var
  sSql : String;

begin
  inherited;
  qryCCusto.Close;
  qryCCusto.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryCCusto.ParamByName('PPLANO').AsInteger    := IntegraBack.Plano;
  qryCCusto.ParamByName('PPLACONTA').AsString  := TiraPontos(cmContaAssoc.Conta.Numero);
  qryCCusto.Open;
  cmbCCusto.Enabled := True;
end;

procedure TFrmAcertaParamContabilFinanc.cmContaAssocExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 99) Then
  Begin
    If iFlgDesconto = 1 Then
    Begin
      If cmContaAssoc.Valida = VcOK Then
      Begin
        If cmContaAssoc.Conta.ObrigaCentrodeCusto Then
          cmContaAssocChange(Self);
      End;
    End
    Else
    Begin
      If cmContaAssoc.Valida = VcOK Then
      Begin
        If cmContaAssoc.Conta.ObrigaCentrodeCusto Then
          cmContaAssocChange(Self);
      End;
    End;
  End;
end;

procedure TFrmAcertaParamContabilFinanc.btnBuscaDadosClick(
  Sender: TObject);
begin
  inherited;
  LimpaComponentes;
  cmContaAssoc.DataSource    := dsTmp;
  cmpmTipoDesDesc.DataSource := dsTmp;
  sSubConta                  := qryTmp.FieldByName('CODSUBCONTA').AsString;
  sCodCentroRespon           := qryTmp.FieldByName('CODCENTRORESPON').AsString;
  If (sSubConta <> '') And (QrySubConta.Locate('CODSUBCONTA', sSubConta, [])) Then
    dblkSubconta.Text := QrySubConta.FieldbyName('NOMESUBCONTA').AsString;

  If IntegraBack.ObrigaCRespon = 'N' Then
  Begin
    dblkCentRespon.Enabled := False;
    bUsaCRespon            := False;
  End
  Else
  Begin
    dblkCentRespon.Enabled := True;
    bUsaCRespon            := True;
    If (sCodCentroRespon <> '') And (qryCentRespon.Locate('CodCentroRespon', sCodCentroRespon, [loCaseInsensitive, loPartialKey])) Then
      dblkCentRespon.Text := qryCentRespon.FieldByName('Nome').AsString;
  End;

  If iFlgDesconto = 0 Then
  Begin
    If (sCodCentroCustoC <> '') And (qryCCusto.Active) Then
    Begin
      qryCCusto.Locate( 'CODCENTROCUSTO', qry.FieldByName('CODCENTROCUSTOC').AsString, [loPartialKey]);
      cmbCCusto.Text            := qryCCusto.FieldByName('Nome').AsString;
      lbDescricaoCCusto.Caption := qryCCusto.FieldByName('Nome').AsString;
    End;
  End
  Else
  Begin
    If (sCodCentroCustoD <> '') And (qryCCusto.Active) Then
    Begin
      qryCCusto.Locate( 'CODCENTROCUSTO', qry.FieldByName('CODCENTROCUSTOD').AsString, [loPartialKey]);
      cmbCCusto.Text            := qryCCusto.FieldByName('Nome').AsString;
      lbDescricaoCCusto.Caption := qryCCusto.FieldByName('Nome').AsString;
    End;
  End;
end;

procedure TFrmAcertaParamContabilFinanc.LimpaComponentes;
begin
  dblkCentRespon.Clear;
  dblkSubConta.Clear;
  cmbCCusto.Clear;
end;

procedure TFrmAcertaParamContabilFinanc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaComponentes;
end;

procedure TFrmAcertaParamContabilFinanc.bbtnConfirmarClick(Sender: TObject);
Var
  sSql : String;

begin
  //inherited;
  If Not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;

  sSql := ' UPDATE TMPDESC SET CODTIPRECDES = ';

  If qryTipoDesemb.FieldByName('CODTIPRECDES').AsString <> '' Then
    sSql := sSql + '''' + qryTipoDesemb.FieldByName('CODTIPRECDES').AsString + ''', '
  Else
    sSql := sSql + ' NULL, ';

  sSql := sSql + 'CODSUBCONTA = ';

  If qrySubConta.FieldByName('CODSUBCONTA').AsString <> '' Then
    sSql := sSql + qrySubConta.FieldByName('CODSUBCONTA').AsString + ', '
  Else
    sSql := sSql + 'NULL, ';

  sSql := sSql + 'PLACONTAC = ';

  If iFlgDesconto = 1 Then
  Begin
    If (cmContaAssoc.Valida = VcOK) Then
    Begin
      If TiraPontos(cmContaAssoc.Conta.Numero) <> '' Then
        sSql := sSql + '''' + TiraPontos(cmContaAssoc.Conta.Numero) + ''', '
      Else
        sSql := sSql + ' NULL, ';
    End;    
  End
  Else
    sSql := sSql + ' NULL, ';

  sSql := sSql + 'PLACONTAD = ';

  If iFlgDesconto = 0 Then
  Begin
    If (cmContaAssoc.Valida = VcOK) Then
    Begin
      If TiraPontos(cmContaAssoc.Conta.Numero) <> '' Then
        sSql := sSql + '''' + TiraPontos(cmContaAssoc.Conta.Numero) + ''', '
      Else
        sSql := sSql + ' NULL, ';
    End;
  End
  Else
    sSql := sSql + ' NULL, ';

  sSql := sSql + ' CODCENTRORESPON = ';

  If qryCentRespon.FieldByName('CODCENTRORESPON').AsString <> '' Then
    sSql := sSql + '''' + qryCentRespon.FieldByName('CODCENTRORESPON').AsString + ''', '
  Else
    sSql := sSql + 'NULL, ';

  sSQL := sSQL + 'CODCENTROCUSTOC = ';

  If iFlgDesconto = 0 Then
  Begin
    If (cmbCCusto.Text <> '') Then
      sSql := sSql + '''' + qryCCusto.FieldByName('CODCENTROCUSTO').AsString + ''', '
    Else
      sSql := sSql + ' NULL, ';
  End
  Else
    sSql := sSql + 'NULL, ';

  sSQL := sSQL + 'CODCENTROCUSTOD = ';

  If iFlgDesconto = 1 Then
  Begin
    If (cmbCCusto.Text <> '') Then
      sSql := sSql + '''' + qryCCusto.FieldByName('CODCENTROCUSTO').AsString + ''''
    Else
      sSql := sSql + ' NULL ';
  End
  Else
    sSql := sSql + 'NULL ';

  sSql := sSql +
          ' WHERE IDPLANOPREV = '+qry.FieldByName('IDPLANOPREV').AsString+
          '   AND IDPESSJUR   = '+qry.FieldByName('IDPESSJUR').AsString+
          '   AND IDLOTE      = '+MontaSelect.ValoresChave[0]+
          '   AND IDPROVENTO  = '+qry.FieldByName('IDPROVENTO').AsString;

  qryAtualiza.Close;
  qryAtualiza.Sql.Clear;
  qryAtualiza.Sql.Add(sSql);

  Try
    qryAtualiza.ExecSQL;
    If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;
  Except
    Raise;
  End;
  bbtnCancelarClick(Self);
  LimpaComponentes;
  qry.Close;
  qry.ParamByName('PIDLOTE').AsInteger := StrToInt(sIdLote);
  qry.Open;
end;

end.
