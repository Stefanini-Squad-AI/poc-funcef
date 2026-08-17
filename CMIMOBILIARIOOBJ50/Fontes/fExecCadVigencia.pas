{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
SOL   : 144460
Kintana : 952763
Responsável : Felipe de Oliveira
Data        : 24/09/2010
Descrição   : Alterado o código de maneira que a pessoa possa excluir alguns imóveis
              ao selecionar a opção todos os imóveis 

}

unit fExecCadVigencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, mImovel, fcButton, fcImgBtn,
  fcShapeBtn, mImovelInativo, mImovelMestre, uCtrlPlanPrevContabil,
  uCtrlImovel, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  Mask, wwdbedit, Wwdotdot, Wwdbcomb, TREdit, wwclient, uCtrlPeriodo, uSistema,
  fProgresso;


type
  TfrmExecCadVigencia = class(TfrmSairAjudaImob)
    ntbPrincipal: TNotebook;
    Panel1: TPanel;
    dtpVigencia: TCMDateTimePicker;
    lblDtVigencia: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    grdPlanoPatroxImovel: TwwDBGrid;
    Label4: TLabel;
    btnAtuTotVlrRateio: TBitBtn;
    btnInsPlanPatro: TBitBtn;
    btnDelPlanPatro: TBitBtn;
    rgAplicarPerc: TRadioGroup;
    Panel3: TPanel;
    molImovelMestre: TmolImovelMestre;
    btnInsImovel: TBitBtn;
    btnDelImovel: TBitBtn;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    Panel4: TPanel;
    grdImovel: TwwDBGrid;
    fcShapeBtn8: TfcShapeBtn;
    fcShapeBtn3: TfcShapeBtn;
    CMSqlParams: TCMSqlParams;
    dsPlanPrevContabil: TwwDataSource;
    dsPatro: TwwDataSource;
    dsTipoImovel: TwwDataSource;
    dsPlanoPatroxImovel: TwwDataSource;
    edtPercRateio: TRealEdit;
    dsImovel: TwwDataSource;
    cdsImovel: TwwClientDataSet;
    cboPlanPrev: TwwDBLookupCombo;
    cboPatro: TwwDBLookupCombo;
    cdsPlanoPatroxImovel: TwwClientDataSet;
    cboTipoImovel: TwwDBLookupCombo;
    edtTotVlrRateio: TRealEdit;
    molImovel: TmolImovel;
    procedure rgAplicarPercClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAtuTotVlrRateioClick(Sender: TObject);
    procedure fcShapeBtn3Click(Sender: TObject);
    procedure btnInsPlanPatroClick(Sender: TObject);
    procedure cboTipoImovelExit(Sender: TObject);
    procedure btnInsImovelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure fcShapeBtn8Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDelPlanPatroClick(Sender: TObject);
    procedure btnDelImovelClick(Sender: TObject);
    procedure cboTipoImovelChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    CtrlPlanPrev : TCtrlPlanPrevContabil;
    CtrlImovel   : TCtrlImovel;
    CtrlPeriodo  : TCtrlPeriodo;
    function MontaPlanoPatroxImovel : OLEVariant;
    function MontaImovel(iIdImovel, iTodosImoveis : integer) : OLEVariant;
    function ValidaPreenchimento : Boolean;
    procedure VerificaPercentSegregacao;
    function VerificaPreenchimentoImovel: boolean;
    function LookupImoveisxMestre(iIdImovelMestre : Integer): OLEVariant;
    function LookupImovel(sCodTipImovel : string = ''; sIdImovel : String = ''): OLEVariant;

    Function AcertaLista(const pCampo,pLista : String) : String;

    procedure AbreQueries;
    procedure FechaQueries;
    function VerificaPlanoCadastrado(iIDPLanoPrev: integer) : boolean;
    function VerificaTotalSegregacao: boolean;
  public
    { Public declarations }
  end;

var
  frmExecCadVigencia: TfrmExecCadVigencia;

implementation
uses  dLookImobiliario, dBaseDados, uComunsImobiliario, uVerificaPreenchimento,
      uFuncoesImob, uMensErro;

{$R *.DFM}

procedure TfrmExecCadVigencia.rgAplicarPercClick(Sender: TObject);
begin
  inherited;
  case rgAplicarPerc.ItemIndex of
    0: begin
        cboTipoImovel.Visible := True;
        fcShapeBtn3.Visible := False;
        btnOK.Enabled := False;
       end;
    1: begin
        cboTipoImovel.Visible := False;
        fcShapeBtn3.Visible := True;
        btnOK.Enabled := True;
       end;
    2: begin
        fcShapeBtn3.Visible := True;
        cboTipoImovel.Visible := False;
        btnOK.Enabled := False;
       end;
  end;



end;

procedure TfrmExecCadVigencia.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPlanPrev := TCtrlPlanPrevContabil.Create;
  CtrlImovel   := TCtrlImovel.Create;
  CtrlPeriodo  := TCtrlPeriodo.Create;

  CtrlImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                        ComunsImobiliario.MensErroMT);
  CtrlPlanPrev.InitializeAs(CtrlImovel);
  CtrlPeriodo.InitializeAs(CtrlImovel);

  cdsPlanoPatroxImovel.Data := MontaPlanoPatroxImovel;
  cdsPlanoPatroxImovel.ControlType.Add('SEL;CheckBox;S;N');

  cdsImovel.Data := MontaImovel(-1,0);
  cdsImovel.ControlType.Add('SEL;CheckBox;S;N');


end;

function TfrmExecCadVigencia.MontaPlanoPatroxImovel: OLEVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT ''N''  AS SEL,                        ' +#13+
          '       PPI.IDPLANOPREV,                       ' +#13+
          '       PPC.NOME AS NOMEPLANO,                 ' +#13+
          '       PPI.IDPATRO,                           ' +#13+
          '       PES.NOME AS NOMEPATRO,                 ' +#13+
          '       PPI.PERCENTRATEIO AS PPIPERCENTRATEIO, ' +#13+
          '       PPI.DATAVIGENCIA,                      ' +#13+
          '       '' '' AS FLGTIPO                       ' +#13+
          '  FROM PLANOPATROXVIGENCIAIMOB PPI,           ' +#13+
          '       PESSOA PES,                            ' +#13+
          '       PLANPREVCONTABIL PPC                   ' +#13+
          ' WHERE 1 = 2                                  ' +#13+
          '   AND PPI.IDPATRO = PES.IDPESSOA             ' +#13+
          '   AND PPI.IDPLANOPREV = PPC.IDPLANOPREV ';
  Result := CtrlImovel.GetDataPacket(sSQL);
end;

procedure TfrmExecCadVigencia.btnAtuTotVlrRateioClick(Sender: TObject);
begin
  VerificaPercentSegregacao;
end;

// Sol 144460 Ktn 952763  Felipe de Oliveira - Inicio
function TfrmExecCadVigencia.MontaImovel(iIdImovel, iTodosImoveis : integer): OLEVariant;
var
  sSQL : string;
begin

      sSQL := ' SELECT ''N''  AS SEL,        ' +#13+
              '        I.IDIMOVEL,            ' +#13+
              '        I.IMONOME AS NOME,     ' +#13+
              '        I.IMOCODIGO AS CODIGO  ' +#13+
              '   FROM IMOVEL I               ';
  if iTodosImoveis = 0 then
  begin
      if iIdImovel <> -1 then
        sSQL := sSQL + '  WHERE I.IDIMOVEL = ' + IntToStr(iIdImovel)
      else
        sSQL := sSQL + '  WHERE 1 = 2';
  end;


  sSQL := sSQL + ' ORDER BY NOME ';

  Result := CtrlImovel.GetDataPacket(sSQL);
end;
// Sol 144460 Ktn 952763  Felipe de Oliveira - Fim
procedure TfrmExecCadVigencia.fcShapeBtn3Click(Sender: TObject);
begin
  inherited;
  if VerificaTotalSegregacao then
  begin
    if cdsImovel.IsEmpty then
      cdsImovel.Data := MontaImovel(-1,0);


    ntbPrincipal.PageIndex := 1;
    // Sol 144460 Ktn 952763  Felipe de Oliveira - Inicio
    if rgAplicarPerc.ItemIndex = 1 then
       cdsImovel.Data := MontaImovel(-1,1);
    // Sol 144460 Ktn 952763  Felipe de Oliveira - Fim        
  end;
end;

function TfrmExecCadVigencia.ValidaPreenchimento: Boolean;
var
  dia, mes, ano : word;
begin
  Result := False;
  DecodeDate(dtpVigencia.Date, ano, mes, dia);

  try
    if (cboPlanPrev.Text = '') then
      raise EValidacao.CreateVal('Selecione o Plano Previdenciário.', cboPlanPrev);

    if VerificaPlanoCadastrado(dtmLookImobiliario.qryLookPlanoPrevIDPLANOPREV.asInteger) then
      raise eValidacao.CreateVal('Plano Previdenciário já informado.', cboPlanPrev);

    if (cboPatro.Text = '') then
      raise EValidacao.CreateVal('Selecione a Patrocinadora.', cboPatro);

    if (length(trim(edtPercRateio.Text)) = 0) then
      raise EValidacao.CreateVal('Informe o percentual.', edtPercRateio);


    if (length(trim(dtpVigencia.Text)) = 0) then
      raise EValidacao.CreateVal('Informe a data de Início da Vigência da Segregação.', dtpVigencia);

    if dtpVigencia.Date >= Now then
      raise EValidacao.createVal('Data de vigência informada é maior que a data atual. Verifique.', dtpVigencia);


    if CtrlPeriodo.VerificaPeriodoBloqueado(Sistema.IdEmpresa, tbBloqueado, mes, ano, False) then
      raise EValidacao.CreateVal('Data de Vigência está no ' + CtrlPeriodo.MessageInfo + '. Verifique.', dtpVigencia);

    if not CtrlImovel.ValidaPlanoxPatro(dtmLookImobiliario.qryLookPlanoPrevIDPLANOPREV.asInteger,
                                        dtmLookImobiliario.qryLookPatrocinadoraIDPESSOA.asInteger) then
      raise EVAlidacao.CreateVal('O Relacionamento da Patrocinadora ' + cboPatro.Text + ' com o Plano Previdenciário ' +
                                 cboPlanPrev.Text + ' é inválido.', cboPlanPrev);

  except
    on ev : EValidacao do begin
      if ev.Show then MessageDlg(ev.message, mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmExecCadVigencia.btnInsPlanPatroClick(Sender: TObject);
begin
  inherited;
  if ValidaPreenchimento then
  begin
    cdsPlanoPatroxImovel.Append;
    cdsPlanoPatroxImovel.FieldByName('SEL').AsString := 'S';
    cdsPlanoPatroxImovel.FieldByName('IDPLANOPREV').AsInteger := dtmLookImobiliario.qryLookPlanoPrevIDPLANOPREV.asInteger;
    cdsPlanoPatroxImovel.FieldByName('NOMEPLANO').asString := dtmLookImobiliario.qryLookPlanoPrevNOME.asString;
    cdsPlanoPatroxImovel.FieldByName('IDPATRO').asInteger := dtmLookImobiliario.qryLookPatrocinadoraIDPESSOA.asInteger;
    cdsPlanoPatroxImovel.FieldByName('NOMEPATRO').asString := dtmLookImobiliario.qryLookPatrocinadoraNOME.asString;
    cdsPlanoPatroxImovel.FieldByName('PPIPERCENTRATEIO').asFloat := StrToFloat(edtPercRateio.Text);
    cdsPlanoPatroxImovel.FieldByName('DATAVIGENCIA').asDateTime := dtpVigencia.Date;
    cdsPlanoPatroxImovel.FieldByName('FLGTIPO').asString := 'P';
    cdsPlanoPatroxImovel.Post;

    dtpVigencia.Enabled := False;
    cboPatro.LookupValue := '';
    cboPlanPrev.LookupValue := '';
    edtPercRateio.Text := '0,00';
    cboPlanPrev.SetFocus;      
  end;
end;

procedure TfrmExecCadVigencia.VerificaPercentSegregacao;
var
  iValorTotRateio : double;
begin
  inherited;
  iValorTotRateio := 0;
  cdsPlanoPatroxImovel.First;
  while not cdsPlanoPatroxImovel.Eof do
  begin
    iValorTotRateio := iValorTotRateio + cdsPlanoPatroxImovel.FieldByName('PPIPERCENTRATEIO').asFloat;
    cdsPlanoPatroxImovel.Next;
  end;
  edtTotVlrRateio.Text := FloatToStr(iValorTotRateio);
  cdsPlanoPatroxImovel.First;
end;

procedure TfrmExecCadVigencia.cboTipoImovelExit(Sender: TObject);
begin
  inherited;
  if Length(trim(cboTipoImovel.Text)) > 0 then
    btnOK.Enabled := True;
end;

procedure TfrmExecCadVigencia.btnInsImovelClick(Sender: TObject);
var
  cdsAux : TCMClientDataSet;
begin
  inherited;
  cdsAux := TCMClientDataSet.Create(nil);
  try
    if not VerificaPreenchimentoImovel then
    begin
      MessageDlg('É necessário informar um imóvel ou um imóvel mestre.', mtWarning, [mbOk], 0);
      Exit;
    end
    else
    begin
      if Length(trim(molImovelMestre.sMestre)) > 0 then
      begin
        cdsAux.Data := LookupImoveisxMestre(molImovelMestre.iMestre);
        while not cdsAux.Eof do
        begin
          cdsImovel.Append;
          cdsImovel.FieldByName('SEL').AsString := 'N';
          cdsImovel.FieldByName('IDIMOVEL').AsInteger := cdsAux.FieldByName('IDIMOVEL').asInteger;
          cdsImovel.FieldByName('CODIGO').AsString := cdsAux.FieldByName('IMOCODIGO').asString;
          cdsImovel.FieldByName('NOME').asString := cdsAux.FieldByName('IMONOME').asString;
          cdsImovel.Post;
          cdsAux.Next;
        end;
      end
      else
      begin
        cdsAux.Data := MontaImovel(molImovel.iImovel,0);
        cdsImovel.Append;
        cdsImovel.FieldByName('SEL').AsString := 'N';
        cdsImovel.FieldByName('CODIGO').asString := cdsAux.FieldByName('CODIGO').asString;
        cdsImovel.FieldByName('IDIMOVEL').asInteger := cdsAux.FieldByName('IDIMOVEL').asInteger;
        cdsImovel.FieldByName('NOME').asString := cdsAux.FieldByName('NOME').asString;
        cdsImovel.Post;
      end;
      btnOK.Enabled := True;
    end;
  finally
    FreeAndNil(cdsAux);
  end;
end;

procedure TfrmExecCadVigencia.btnOKClick(Sender: TObject);
var
  cdsImovelVigencia, cdsAux : TCMClientDataSet;
  sIdImovel : string;
  bOK : boolean;
  i : integer;
begin
  cdsImovelVigencia := TCMClientDataSet.Create(nil);
  cdsAux := TCMClientDataSet.Create(nil);
  bOK := True;
  i:= 0;
  inherited;
  try
   if VerificaTotalSegregacao then
   begin
    if not cdsPlanoPatroxImovel.IsEmpty then
    begin
     CtrlImovel.CdsImovel := cdsImovelVigencia;
     cdsAux.Data :=  MontaPlanoPatroxImovel;
     cdsAux.Data := cdsPlanoPatroxImovel.Data;

     CtrlImovel.CdsPlanoPatroxImovel := cdsAux;

     case rgAplicarPerc.ItemIndex of
      0 : cdsImovelVigencia.Data := LookupImovel(dtmLookImobiliario.qryLookTipoImovel.FieldByName('CODTIPIMOVEL').asString, '');
      // Sol 144460 Ktn 952763  Felipe de Oliveira - inicio
      1 : begin
            if not cdsImovel.IsEmpty then
            begin
              cdsImovel.First;
              while not cdsImovel.Eof do
              begin
                if sIdImovel = '' then
                  sIdImovel := cdsImovel.FieldByName('IDIMOVEL').asString
                else
                  sIdImovel := sIdImovel + ', ' + cdsImovel.FieldByName('IDIMOVEL').asString;
                cdsImovel.Next;
              end;
              cdsImovelVigencia.Data := LookupImovel('', sIdImovel);
            end
            else
             cdsImovelVigencia.Data := LookupImovel('','');
          end;
      // Sol 144460 Ktn 952763  Felipe de Oliveira - Fim
      2 : begin
            if not cdsImovel.IsEmpty then
            begin
              cdsImovel.First;
              while not cdsImovel.Eof do
              begin
                if sIdImovel = '' then
                  sIdImovel := cdsImovel.FieldByName('IDIMOVEL').asString
                else
                  sIdImovel := sIdImovel + ', ' + cdsImovel.FieldByName('IDIMOVEL').asString;
                cdsImovel.Next;
              end;
              cdsImovelVigencia.Data := LookupImovel('', sIdImovel);
            end
            else
              MessageDlg('É necessário informar os imóvel(is) que terão a segregação atualizada.', mtWarning, [mbOK], 0);
          end;
     end;

     if not cdsImovelVigencia.IsEmpty then
     begin
      CtrlImovel.CreateThreadProgresso;
      CtrlImovel.StartTransaction;
      cdsImovelVigencia.First;
      while not cdsImovelVigencia.Eof do
      begin
        frmProgresso.MostraFormProgresso('Atualizando registro de Segregação do Imóvel ' + cdsImovelVigencia.FieldByName('IMONOME').asString + '... ');
        if not CtrlImovel.AtualizaBem(cdsImovelVigencia.FieldByName('IDIMOVEL').asInteger, True) then
        begin
          bOK := False;
          Exit;
        end;

        if not CtrlImovel.AtualizaPlanoPatroxVigenciaImob(cdsImovelVigencia.FieldByName('IDIMOVEL').asInteger) then
        begin
          bOK := False;
          Exit;
        end;

        if not CtrlImovel.AtualizaPlanoPatroxImovel(cdsImovelVigencia.FieldByName('IDIMOVEL').asInteger) then
        begin
          bOK := False;
          Exit;
        end;
        Inc(i);
        frmProgresso.AndaFormProgresso(i, cdsImovelVigencia.RecNo);
        cdsImovelVigencia.Next;
       end;

       CtrlImovel.Commit;

       if bOK then
       begin
        frmProgresso.EscondeFormProgresso;
        MessageDlg('Atualização de Vigência de Imóveis executada com sucesso.', mtInformation, [mbOk], 0);
        FechaQueries;
        dtpVigencia.Enabled := True;
        dtpVigencia.Date := Now;
        cboTipoImovel.Visible := False;
        fcShapeBtn8.Visible := False;
        ntbPrincipal.PageIndex := 0;
        rgAplicarPerc.ItemIndex := 1;
        edtTotVlrRateio.Text := '0,00';
        cdsPlanoPatroxImovel.Data := MontaPlanoPatroxImovel;
        cdsImovel.EmptyDataSet;
        AbreQueries;
       end;
     end
     else
        MessageDlg('Não há imóveis a serem atualizados.', mtWarning, [mbOk], 0);
    end
    else
      MessageDlg('É necessário informar critério segregação para a condição escolhida.', mtWarning, [mbOK], 0);
   end;
  finally
    FreeAndNil(cdsImovelVigencia);
    CtrlImovel.FreeThreadProgresso;
  end;
end;

procedure TfrmExecCadVigencia.fcShapeBtn8Click(Sender: TObject);
begin
  inherited;
  ntbPrincipal.PageIndex := 0;
  cdsImovel.Close;
end;

function TfrmExecCadVigencia.VerificaPreenchimentoImovel: boolean;
begin
  if (Length(trim(molImovelMestre.sMestre)) > 0) and (Length(trim(molImovel.sImovel)) > 0) then
    Result := True;
end;

function TfrmExecCadVigencia.LookupImoveisxMestre(
  iIdImovelMestre: Integer): OLEVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT I.IDIMOVEL, I.IMOCODIGO, I.IMONOME ' +#13+
          '  FROM IMOVEL I, IMOVEL IM   ' +#13+
          ' WHERE IM.IDIMOVEL = ' + IntToStr(iIdImovelMestre) +#13+
          '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL ' +#13+
          '  ORDER BY I.IMOCODIGO ';
  Result := CtrlImovel.GetDataPacket(sSQL);
end;

function TfrmExecCadVigencia.LookupImovel(sCodTipImovel,
  sIdImovel: String): OLEVariant;
var
  sSQL : String;
begin
  sSQL := 'SELECT IDIMOVELMESTRE, IDIMOVEL, FLGTIPOIMOVEL, IMONOME ' +#13+
          '  FROM IMOVEL                                           ';
  if sCodTipImovel <> '' then
    sSQL := sSQL + '  WHERE CODTIPIMOVEL = ' + QuotedStr(sCodTipImovel);

  if sIdImovel <> '' then
    sSQL := sSQL + '  WHERE ' + AcertaLista('IDIMOVEL',sidImovel);


{ IDIMOVEL IN (' + sIdImovel +')';}

  Result := CtrlImovel.GetDataPacket(sSQL);
end;

Function TfrmExecCadVigencia.AcertaLista(const pCampo,pLista : String) : String;
var lstLista : TStringList;
    iCount,iPos : Integer;
 sLista,sLinha : String;
begin
  lstLista := TStringList.Create;
  sLista := pLista;
  iCount := 0;
  sLinha := pCampo +' in(';
  while sLista <> '' do
  begin
    iPos := Pos(',',sLista);
 If iPos = 0 then
  iPos := length(sLista) + 1;
    If iPos > 0 then
 begin
   sLinha := sLinha + Copy(sLista,1,iPos-1) + ',';
   sLista := Copy(sLista,iPos+1,length(sLista));
 end;
    inc(iCount);
 If (iCount = 900) or (sLista = '') then
 begin
  lstLista.Add(Copy(sLinha,1,Length(sLinha)-1)+')');
  If sLista <> '' then
    sLinha := ' or '+pCampo+' in (';
  iCount := 0;
 end;

  end;

  
  result := lstLista.Text;
  lstLista.Clear;
  FreeAndNil(lstLista);
end;

procedure TfrmExecCadVigencia.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlPlanPrev);
  FreeAndNil(CtrlImovel);
  FreeAndNil(CtrlPeriodo);
end;

procedure TfrmExecCadVigencia.AbreQueries;
var
  sTipoImovelAnt : string;
  sPlanPrevAnt : string;
  sPatroAnt : string;
begin
  // Tipo de Imóvel ------------------------------------------------------------
   sTipoImovelAnt := '';
   if cboTipoImovel.LookupValue <> '' then
    sTipoImovelAnt := cboTipoImovel.LookupValue;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Close;
   dtmLookImobiliario.qryLookTipoImovel.Open;
   cboTipoImovel.LookupValue := sTipoImovelAnt;
   // --------------------------------------------------------------------------

  // Plano Previdenciário ------------------------------------------------------
    sPlanPrevAnt := '';
    if cboPlanPrev.LookupValue <> '' then
      sPlanPrevAnt := cboPlanPrev.LookupValue;

    LimpaParametros(dtmLookImobiliario.qryLookPlanoPrev);
    dtmLookImobiliario.qryLookPlanoPrev.Close;
    dtmLookImobiliario.qryLookPlanoPrev.Open;
    cboPlanPrev.LookupValue := sPlanPrevAnt;
  // ---------------------------------------------------------------------------

  // Patrocinadora -------------------------------------------------------------
    sPatroAnt := '';
    if cboPatro.LookupValue <> '' then
      sPatroAnt := cboPatro.LookupValue;

    LimpaParametros(dtmLookImobiliario.qryLookPatrocinadora);
    dtmLookImobiliario.qryLookPatrocinadora.Close;
    dtmLookImobiliario.qryLookPatrocinadora.ParamByName('pIdEmpresa').asInteger := Sistema.IdEmpresa;
    dtmLookImobiliario.qryLookPatrocinadora.Open;
    cboPatro.LookupValue := sPatroAnt;
  // ---------------------------------------------------------------------------
end;

procedure TfrmExecCadVigencia.FechaQueries;
begin
  dtmLookImobiliario.qryLookPlanoPrev.Close;
  dtmLookImobiliario.qryLookPatrocinadora.Close;
  dtmLookImobiliario.qryLookTipoImovel.Close;
end;

procedure TfrmExecCadVigencia.FormShow(Sender: TObject);
begin
  inherited;
  AbreQueries;
  dtpVigencia.Date := Now;
end;

procedure TfrmExecCadVigencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FechaQueries;
end;

procedure TfrmExecCadVigencia.btnDelPlanPatroClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Deseja excluir os Critérios de Segregação Marcados?', 'Confirmação',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    cdsPlanoPatroxImovel.DisableControls;
    cdsPlanoPatroxImovel.First;
    while not cdsPlanoPatroxImovel.Eof do
    begin
      if cdsPlanoPatroxImovel.FieldByName('SEL').asString = 'S' then
        cdsPlanoPatroxImovel.Delete
      else  
      cdsPlanoPatroxImovel.Next;
    end;
    cdsPlanoPatroxImovel.First;
    cdsPlanoPatroxImovel.EnableControls;
    edtTotVlrRateio.Text := '0,00';
  end;
end;

procedure TfrmExecCadVigencia.btnDelImovelClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Deseja excluir os registros do(s) imóvel(is) marcados?', 'Confirmação',
             mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    cdsImovel.DisableControls;
    cdsImovel.First;
    while not cdsImovel.Eof do
    begin
      if cdsImovel.FieldByName('SEL').asString = 'S' then
        cdsImovel.Delete
      else
        cdsImovel.Next;
    end;
    cdsImovel.First;
    cdsImovel.EnableControls;
  end;
end;

procedure TfrmExecCadVigencia.cboTipoImovelChange(Sender: TObject);
begin
  inherited;
  btnOK.Enabled := True;
end;

procedure TfrmExecCadVigencia.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FechaQueries;
  dtpVigencia.Enabled := True;
  dtpVigencia.Date := Now;
  cboTipoImovel.Visible := False;
  fcShapeBtn3.Visible := False;
  rgAplicarPerc.ItemIndex := 1;
  edtPercRateio.Text := '0,00';
  edtTotVlrRateio.Text := '0,00';
  ntbPrincipal.PageIndex := 0;
  cdsPlanoPatroxImovel.Data := MontaPlanoPatroxImovel;
  cdsImovel.EmptyDataSet;
  molImovelMestre.btnLimpaImovelClick(Sender);
  molImovel.btnLimpaImovelClick(Sender);
  AbreQueries;
end;

function TfrmExecCadVigencia.VerificaPlanoCadastrado(
  iIdPlanoPrev: integer): boolean;
begin
  Result := False;
  cdsPlanoPatroxImovel.First;
  while not cdsPlanoPatroxImovel.Eof do
  begin
    if cdsPlanoPatroxImovel.FieldByName('IDPLANOPREV').asInteger = iIdPlanoPrev then
    begin
      Result := True;
      Break;
    end;
    cdsPlanoPatroxImovel.Next;
  end;
  cdsPlanoPatroxImovel.First;
end;

function TfrmExecCadVigencia.VerificaTotalSegregacao: boolean;
var
  iTotRateio : double;
begin
  Result := True;
  iTotRateio := 0;
  cdsPlanoPatroxImovel.First;
  while not cdsPlanoPatroxImovel.Eof do
  begin
    iTotRateio := iTotRateio + cdsPlanoPatroxImovel.FieldByName('PPIPERCENTRATEIO').asFloat;
    cdsPlanoPatroxImovel.Next;
  end;

  if iTotRateio > 100 then
  begin
    MessageDlg('Percentual de segregação não pode ser maior que 100%.', mtWarning, [mbOK], 0);
    Result := False;
  end
  else
    if iTotRateio < 100 then
    begin
      MessageDlg('Percentual de segregação não pode ser menor que 100%.', mtWarning, [mbOK], 0);
      Result := False;
    end;
  cdsPlanoPatroxImovel.First;
end;
// Sol 144460 Ktn 952763  Felipe de Oliveira - Inicio 
procedure TfrmExecCadVigencia.FormActivate(Sender: TObject);
begin
  inherited;
  case rgAplicarPerc.ItemIndex of
    0: begin
        cboTipoImovel.Visible := True;
        fcShapeBtn3.Visible := False;
        btnOK.Enabled := False;
       end;
    1: begin
        cboTipoImovel.Visible := False;
        fcShapeBtn3.Visible := True;
        btnOK.Enabled := True;
       end;
    2: begin
        fcShapeBtn3.Visible := True;
        cboTipoImovel.Visible := False;
        btnOK.Enabled := False;
       end;
  end;
end;
// Sol 144460 Ktn 952763  Felipe de Oliveira - Fim
end.
