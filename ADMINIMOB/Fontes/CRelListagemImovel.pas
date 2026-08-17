unit CRelListagemImovel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, StdCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uModuloImobiliario,
  DBCtrls, uCtrlPatrocinadora, uCtrlPlanPrevContabil, uCtrlPlanPrevContabPatro,
  DBClient, uCMClientDataSet;

type
  TcfgRelListagemImovel = class(TcfgRel)
    Label1: TLabel;
    chkArea: TCheckBox;
    chkAquisicao: TCheckBox;
    edtImovelMestre: TEdit;
    btnBuscaImovelMestre: TBitBtn;
    btnLimpaImovelMestre: TBitBtn;
    rdgOcupacao: TRadioGroup;
    chkAtivo: TCheckBox;
    Label2: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    lbl2: TLabel;
    cbbPlano: TDBLookupComboBox;
    lbl1: TLabel;
    cbbPatro: TDBLookupComboBox;
    cdsPlano: TCMClientDataSet;
    dsPlano: TDataSource;
    cdsPatro: TCMClientDataSet;
    dsPatro: TDataSource;
    procedure btnBuscaImovelMestreClick(Sender: TObject);
    procedure btnLimpaImovelMestreClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);


  private { Private declarations }
    iImovelMestre : integer;

    // SOL 126320 KTN 660564 Ricardo A.
    CtrlPatrocinadora: TCtrlPatrocinadora;
    CtrlPlanoPrev: TCtrlPlanPrevContabil;
    CtrlPlanoPatro: TCtrlPlanPrevContabPatro;

    function VerificaPreenchimento: Boolean;
    // FIM SOL 126320 KTN 660564 Ricardo A.


    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
  cfgRelListagemImovel: TcfgRelListagemImovel;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, UComunsImobiliario, uVerificaPreenchimento, dRelAdminImob,
   dLookImobiliario, DMS, uFuncoesImob, DBaseDados;



procedure TcfgRelListagemImovel.MontaQuery;
var
  // SOL 126320 KTN 660564 Ricardo A.
  sParamPlanoPatro: string;
  sSql: string;
  // FIM SOL 126320 KTN 660564 Ricardo A.

begin
  // SOL 126320 KTN 660564 Ricardo A.
  if ( Trim( cbbPatro.Text ) <> '' ) then
  begin
    sParamPlanoPatro := ' AND EXISTS(' +
        '       SELECT 1' +
        '       FROM PLANOPATROXIMOVEL PPI' +
        '       WHERE PPI.IDIMOVEL = I.IDIMOVEL';
    sParamPlanoPatro := sParamPlanoPatro + '       AND PPI.IDPATRO = ' + IntToStr( cbbPatro.KeyValue );
    sParamPlanoPatro := sParamPlanoPatro + '       AND PPI.IDPLANOPREV = ' + IntToStr( cbbPlano.KeyValue );
    sParamPlanoPatro := sParamPlanoPatro + '       )';
  end
  else
    sParamPlanoPatro := '';

  sSql :=
    ' SELECT' +
    '           IM.IDIMOVEL AS IDMESTRE, IM.IMONOME AS NOMEMESTRE,' +
    '           IM.IMOLOGRADOURO, IM.IMONUMERO, IM.IMOBAIRRO, IM.IMOCEP,' +
    '           CID.NOME AS DSC_CIDADE, CID.UF AS DSC_UF,' +
    '           I.IMONOME AS NOMEIMOVEL, I.IMOMATRICULA, I.IMOCODIGO,' +
    '           I.FLGSTATUSOCUPACAO, I.IDIMOVEL, I.IMOAREA,' +
    '           I.IMOVLRCOMPRA, I.IMODATACOMPRA, I.IMOMOEDACOMPRA,' +
    '           I.IMOVLRREAVAL, I.IMODATAREAVAL, I.IMOMOEDAREAVAL,' +
    '           I.IMOVLRMERCADO, I.IMODATAMERCADO, I.IMOMOEDAMERCADO,' +
    '           M.MOESIGLA AS MOEDA_COMPRA,' +
    '           MR.MOESIGLA AS MOEDA_REAVAL,' +
    '           T.DESCTIPOIMOVEL AS TIPO_IMOVEL,' +
    '           I.IMOVAGAS,' +
    '           I.IMOFRACAOIDEAL,' +
    '           I.IMOAREACOMUM, I.IMOAREATOTAL, I.IMOAREAGERENCIAL,' +
    '           DECODE(I.FLGSTATUSOCUPACAO, NULL, ''VAGO'', DECODE(I.FLGSTATUSOCUPACAO, ''O'', ''Ocupado'', ''VAGO'')) AS OCUPACAO_IMOVEL' +
    ' FROM' +
    '           IMOVEL I, IMOVEL IM, TIPOIMOVEL T, MOEDA M, CIDADES CID, MOEDA MR' +
    ' WHERE' +
    '           (I.IDPESSOA = ' + IntToStr( Sistema.IdEmpresa ) + ') ';

  // Imóvel Mestre
  if Length( Trim( edtImovelMestre.Text ) ) > 0 then
    sSql := sSql + '           AND ( I.IDIMOVELMESTRE = ' + IntToStr( iImovelMestre ) + ' )';

  // Segmento
  if length(trim(DBcboTipoImovel.Text)) > 0 then
    sSql := sSql + '           AND ( I.CODTIPIMOVEL = ' + QuotedStr( DBcboTipoImovel.lookupValue ) + ' )';

  // Ocupação
  case rdgOcupacao.ItemIndex of
    0: sSql := sSql + '           AND ( I.FLGSTATUSOCUPACAO = ''O'' )';
    1: sSql := sSql + '           AND ( I.FLGSTATUSOCUPACAO = ''D'' )';
  end;

  // área
  if chkArea.Checked then
    sSql := sSql + '           AND ( I.IMOAREA > 0 )';

  // Valor de Aquisição
  if chkAquisicao.Checked then
    sSql := sSql + '           AND ( I.IMOVLRCOMPRA <> 0 )';

  // Imóvel Ativo
  if chkAtivo.Checked then
    sSql := sSql + '           AND ( I.FLGATIVO = 1 )';

  sSql := sSql +
    '           AND ( IM.FLGTIPOIMOVEL = 0 )' +
    '           AND ( I.FLGTIPOIMOVEL = 1 )' +
    '           AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) )' +
    '           AND ( IM.IDCIDADES = CID.IDCIDADES(+) )' +
    '           AND ( I.CODTIPIMOVEL = T.CODTIPIMOVEL(+) )' +
    '           AND ( I.IMOMOEDACOMPRA = M.MOECODIGO (+) )' +
    '           AND ( I.IMOMOEDAREAVAL = MR.MOECODIGO (+) )' +
    sParamPlanoPatro +
    ' ORDER BY' +
    '           NOMEMESTRE, NOMEIMOVEL';

  dtmRelAdminImob.qryListagemImovel.Close;
  dtmRelAdminImob.qryListagemImovel.Sql.Clear;
  dtmRelAdminImob.qryListagemImovel.SQL.Text := sSql;
  dtmRelAdminImob.qryListagemImovel.FieldDefs.Add( 'EnderecoExtenso', ftString, 120 );
  dtmRelAdminImob.qryListagemImovel.FieldByName( 'EnderecoExtenso' ).FieldKind := fkCalculated;
  dtmRelAdminImob.qryListagemImovel.FieldDefs.Add( 'Ocupacao', ftString, 12 );
  dtmRelAdminImob.qryListagemImovel.FieldByName( 'Ocupacao' ).FieldKind := fkCalculated;
  dtmRelAdminImob.qryListagemImovel.FieldDefs.Add( 'DataReferencia', ftDateTime );
  dtmRelAdminImob.qryListagemImovel.FieldByName( 'DataReferencia' ).FieldKind := fkCalculated;

  dtmRelAdminImob.qryListagemImovel.Prepare;
  // FIM SOL 126320 KTN 660564 Ricardo A.


   // Carrega o Logotipo - Marcio Motta - 28/06/2004
   if ModuloImobiliario.AdminImob.bFlgLogoRelat then
      dtmRelAdminImob.ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
   else
      dtmRelAdminImob.ppLogotipo.Picture := nil;

   // preenche as flags
   dtmRelAdminImob.bArea      := chkArea.Checked;
   dtmRelAdminImob.bAquisicao := chkAquisicao.Checked;

//   with dtmRelAdminImob.qryListagemImovel do begin
//      LimpaParametros(dtmRelAdminImob.qryListagemImovel);
//      ParamByName('PIDPESSOA').asInteger              := Sistema.idEmpresa;
//
//      // Segmento
//      if length(trim(DBcboTipoImovel.Text)) > 0 then
//         ParamByName('PCODTIPIMOVEL').asString        := DBcboTipoImovel.lookupValue;
//
//      // Imóvel Mestre
//      if length(trim(edtImovelMestre.Text)) > 0 then
//         ParamByName('PIDIMOVELMESTRE').asInteger     := iImovelMestre;
//
//
//      // Ocupação
//      case rdgOcupacao.ItemIndex of
//      0: ParamByName('PFLGSTATUSOCUPACAO').asString   := 'O';
//      1: ParamByName('PFLGSTATUSOCUPACAO').asString   := 'D';
//      end;
//
//      // Área
//      if chkArea.Checked then
//         ParamByName('PIMOAREA').asFloat              := 1;
//
//      // Valor de Aquisição
//      if chkAquisicao.Checked then
//         ParamByName('PIMOVLRCOMPRA').asFloat         := 1;
//
//      // Imóvel Ativo
//      if chkAtivo.Checked then
//         ParamByName('PFLGATIVO').asInteger           := 1;
//
//      Open;
//   end;
  dtmRelAdminImob.qryListagemImovel.Open;
  dtmRelAdminImob.qryCompSocietaria.Open;
end;



procedure TcfgRelListagemImovel.btnBuscaImovelMestreClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_ImovelMestre.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelMestre.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iImovelMestre        := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);
      edtImovelMestre.Text := dtmMS.MS_ImovelMestre.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaImovelMestre.SetFocus;
end;



procedure TcfgRelListagemImovel.btnLimpaImovelMestreClick(Sender: TObject);
begin
   inherited;

   iImovelMestre := -1;
   edtImovelMestre.Clear;
end;



procedure TcfgRelListagemImovel.FormShow(Sender: TObject);
begin
  inherited;
   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;
end;

procedure TcfgRelListagemImovel.FormCreate(Sender: TObject);
begin
  inherited;
  // SOL 126320 KTN 660564 Ricardo A.
  CtrlPatrocinadora := TCtrlPatrocinadora.Create;
  CtrlPatrocinadora.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlPlanoPrev := TCtrlPlanPrevContabil.Create;
  CtrlPlanoPrev.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                            ComunsImobiliario.MensErroMT);

  CtrlPlanoPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanoPatro.Initialize(dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, true);

  cdsPatro.Data := CtrlPatrocinadora.ListaPatrocinadora();
  cdsPlano.Data := CtrlPlanoPrev.ListaPlanPrevContabil();
  // FIM SOL 126320 KTN 660564 Ricardo A.

end;

function TcfgRelListagemImovel.VerificaPreenchimento: Boolean;
begin
  Result := True;

  try

    // SOL 126320 KTN 660564 Ricardo A.
    if ( Trim(cbbPlano.Text) <> '' ) and ( Trim(cbbPatro.Text) = '' ) then
      raise EValidacao.CreateVal( 'Se o Plano Previdenciário estiver preenchido o Patrocinador' +
        ' também deve ser preenchido.', cbbPatro );
    if ( Trim( cbbPlano.Text ) = '' ) and ( Trim( cbbPatro.Text ) <> '' ) then
      raise EValidacao.CreateVal( 'Se o Patrocinador estiver preenchido o Plano Previdenciário' +
        ' também deve ser preenchido.', cbbPlano );

    if ( Trim(cbbPlano.Text) <> '' ) and
      not CtrlPlanoPatro.ValidaPlanoPatro( cbbPatro.KeyValue, cbbPlano.KeyValue ) then
      raise EValidacao.createVal( CtrlPlanoPatro.MessageInfo, cbbPatro );
    // FIM SOL 126320 KTN 660564 Ricardo A.

  except

    on ev : EValidacao do
    begin
      Result := False;
      Screen.Cursor := crDefault;
      if ev.Show then
        MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then
        ev.Control.SetFocus;
    end;
  end;

end;

procedure TcfgRelListagemImovel.bbtnConfirmarClick(Sender: TObject);
begin
   // FIM SOL 126320 KTN 660564 Ricardo A.
   if VerificaPreenchimento then
     inherited;
   //  SOL 126320 KTN 660564 Ricardo A.
end;

end.
