unit FDelPorcentSegreg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, mImovel, mImovelMestre, Grids,
  Wwdbigrd, Wwdbgrid, fcButton, fcImgBtn, fcShapeBtn, wwdbdatetimepicker,
  CMDateTimePicker, Db, DBClient, wwclient, Wwdatsrc, uCmSqlParams,uCtrlImovel,uSistema,
  uCMClientDataSet,dbTables, uCtrlOperImob, Wwquery;

type
  TfrmDelPorcentagemSegreg = class(TfrmSairAjudaImob)
    ntbPrincipal: TNotebook;
    rgAplicarPerc: TRadioGroup;
    Panel4: TPanel;
    grdImovel: TwwDBGrid;
    Panel3: TPanel;
    molImovelMestre: TmolImovelMestre;
    btnInsImovel: TBitBtn;
    btnDelImovel: TBitBtn;
    molImovel: TmolImovel;
    cboTipoImovel: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnCancelar: TBitBtn;
    BtnContinuar: TBitBtn;
    BtnVoltar: TBitBtn;
    btnOK: TBitBtn;
    dtpVigenciaInicial: TCMDateTimePicker;
    dtpVigenciaFinal: TCMDateTimePicker;
    CMSqlParams: TCMSqlParams;
    dsImovel: TwwDataSource;
    cdsImovel: TwwClientDataSet;
    dsTipoImovel: TwwDataSource;
    obs: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pnlDesfaz: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    dbgDesfazVigencias: TwwDBGrid;
    dbgVigenciasBloqueadas: TwwDBGrid;
    cdsDesfazVigencia: TwwClientDataSet;
    cdsVigenciaBloqueada: TwwClientDataSet;
    dsDesfazVigenc: TwwDataSource;
    dsVigencBloq: TwwDataSource;
    bbtnInverteSelEstab: TBitBtn;
    bbtnSelTodosEstab: TBitBtn;
    cdsImovelSEL: TStringField;
    cdsImovelIDIMOVEL: TFloatField;
    cdsImovelCODIGO: TStringField;
    cdsImovelNOME: TStringField;
    dsVigencias: TwwDataSource;
    qryVigencias: TwwQuery;
    qryVigenciasIDIMOVEL: TFloatField;
    qryVigenciasNOME: TStringField;
    qryVigenciasCODIGO: TStringField;
    qryVigenciasDATA: TDateTimeField;
    qryVigenciasMAXDATA: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnVoltarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnContinuarClick(Sender: TObject);
    procedure btnInsImovelClick(Sender: TObject);
    function LookupImoveisxMestre(iIdImovelMestre: Integer): OLEVariant;
    procedure btnDelImovelClick(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure rgAplicarPercClick(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  CtrlImovel   : TCtrlImovel;
  CtrlOperImob : TCtrlOperImob;
  procedure AbreQueries;
  procedure FechaQueries;
  procedure SeparaVigencia;
  procedure DeletaInsereImoveis;
  function MontaImovel(iIdImovel, iTodosImoveis : integer) : OLEVariant;
  function MontaVigencias(sIdImoveis : String) : String;
  function AcertaLista(const pCampo,pLista : String) : String;
  function VerificaPreenchimentoImovel : boolean;
  public
    { Public declarations }
  dDataVigente : TDate;
  end;

var
  frmDelPorcentagemSegreg: TfrmDelPorcentagemSegreg;

implementation
uses dLookImobiliario, dBaseDados, uComunsImobiliario, uVerificaPreenchimento,
      uFuncoesImob, uMensErro, FProgresso;
{$R *.DFM}

procedure TfrmDelPorcentagemSegreg.FormShow(Sender: TObject);
begin
  inherited;
  AbreQueries;
  ntbPrincipal.PageIndex := 0;
end;

procedure TfrmDelPorcentagemSegreg.AbreQueries;
var
  sTipoImovelAnt : string;
  qryAux : TQuery;
begin
   qryAux := TQuery.Create(nil);

   qryAux.DatabaseName := 'BaseDados';

   // Tipo de Imóvel ------------------------------------------------------------
   sTipoImovelAnt := '';
   if cboTipoImovel.LookupValue <> '' then
    sTipoImovelAnt := cboTipoImovel.LookupValue;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Close;
   dtmLookImobiliario.qryLookTipoImovel.Open;
   cboTipoImovel.LookupValue := sTipoImovelAnt;
   // --------------------------------------------------------------------------

   // primeira data da vigencia...
   Try
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT (DATABLOQUEIO + 1) AS DATA  FROM DIASBLOQMOD WHERE IDMODULO = 64');
   qryAux.Open;

   dtpVigenciaInicial.DateTime := StrToDate(qryAux.FieldByName('DATA').AsString);

   dDataVigente := StrToDate(qryAux.FieldByName('DATA').AsString);

   Finally
      FreeAndNil(qryAux);
   End;

end;

procedure TfrmDelPorcentagemSegreg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FechaQueries;
end;

procedure TfrmDelPorcentagemSegreg.FechaQueries;
begin
   dtmLookImobiliario.qryLookTipoImovel.Close;
   FreeAndNil(cdsImovel);
   FreeAndNil(cdsDesfazVigencia);
   FreeAndNil(cdsVigenciaBloqueada);
   //FreeAndNil(qryVigencias);
end;

procedure TfrmDelPorcentagemSegreg.BtnVoltarClick(Sender: TObject);
begin
  inherited;
  case ntbPrincipal.PageIndex of
  1:
  begin
    cdsImovel.EmptyDataSet;
    ntbPrincipal.PageIndex := 0;
    BtnVoltar.Visible := False;
  end;
  2:
  begin
     cdsDesfazVigencia.Close;
     cdsVigenciaBloqueada.Close;
     ntbPrincipal.PageIndex := 1;
     BtnContinuar.Visible := True;
  end;

  end;//end case

end;

procedure TfrmDelPorcentagemSegreg.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlImovel   := TCtrlImovel.Create;

  CtrlImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                        ComunsImobiliario.MensErroMT);

  ntbPrincipal.PageIndex := 0;
end;

function TfrmDelPorcentagemSegreg.MontaImovel(iIdImovel, iTodosImoveis : integer): OLEVariant;
var
sSql : String;
begin
  sSQL := ' SELECT DISTINCT ''N''  AS SEL, '+#13+
          '        I.IDIMOVEL,             '+#13+
          '        I.IMONOME AS NOME,      '+#13+
          '        I.IMOCODIGO AS CODIGO  '+#13+
          '   FROM IMOVEL I          '+#13;

      if (cboTipoImovel.Text <> '')  and (cboTipoImovel.Visible) and (ntbPrincipal.PageIndex = 0) then
         sSQL := sSQL + 'WHERE I.CODTIPIMOVEL = ' + QuotedStr(dtmLookImobiliario.qryLookTipoImovel.FieldByName('CODTIPIMOVEL').AsString) +#13;

      if (iIdImovel <> -1) and ((cboTipoImovel.Text <> '')  and (cboTipoImovel.Visible) and (ntbPrincipal.PageIndex = 0))then
        sSQL := sSQL + '  AND I.IDIMOVEL = ' + IntToStr(iIdImovel)
      else
        if (iIdImovel <> -1) then
           sSQL := sSQL + '  WHERE I.IDIMOVEL = ' + IntToStr(iIdImovel);

  Result := CtrlImovel.GetDataPacket(sSQL);
end;

procedure TfrmDelPorcentagemSegreg.BtnContinuarClick(Sender: TObject);
begin
  inherited;
    if dtpVigenciaFinal.Date > 0 then
       if dtpVigenciaInicial.Date > dtpVigenciaFinal.Date then
       begin
          MessageDlg('A data final não pode ser menor que a data inicial!', mtError, [mbOK], 0);
          dtpVigenciaFinal.SetFocus;
          Exit;
       end;

    case ntbPrincipal.PageIndex of
    0: begin
         if rgAplicarPerc.ItemIndex = 0 then
         begin
            if Trim(cboTipoImovel.Text) ='' then
            begin
               MessageDlg('Por favor preencha o segmento dos imóveis!', mtWarning, [mbOK], 0);
               cboTipoImovel.SetFocus;
               Exit;
            end;
         end;

          if rgAplicarPerc.ItemIndex <> 2 then
           cdsImovel.Data := MontaImovel(-1,0);

          ntbPrincipal.PageIndex := 1;           
       end;
    1: begin
         ntbPrincipal.PageIndex := 2;
         // vai dividir os imoveis que podem ser alterados dos q não podem
         SeparaVigencia;
       end;
    end;// end case   

end;

function TfrmDelPorcentagemSegreg.VerificaPreenchimentoImovel: boolean;
begin
  if (Length(trim(molImovelMestre.sMestre)) > 0) or (Length(trim(molImovel.sImovel)) > 0) then
    Result := True;
end;

procedure TfrmDelPorcentagemSegreg.btnInsImovelClick(Sender: TObject);
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
          cdsImovel.FieldByName('CODIGO').AsString := cdsAux.FieldByName('CODIGO').asString;
          cdsImovel.FieldByName('NOME').asString := cdsAux.FieldByName('NOME').asString;
          cdsImovel.Post;
          cdsAux.Next;
        end;
      end
      else
      begin
        cdsAux.Data := MontaImovel(molImovel.iImovel,0);
        while not cdsAux.Eof do
        begin
        cdsImovel.Append;
        cdsImovel.FieldByName('SEL').AsString := 'N';
        cdsImovel.FieldByName('IDIMOVEL').asInteger := cdsAux.FieldByName('IDIMOVEL').asInteger;
        cdsImovel.FieldByName('CODIGO').asString := cdsAux.FieldByName('CODIGO').asString;
        cdsImovel.FieldByName('NOME').asString := cdsAux.FieldByName('NOME').asString;
        cdsImovel.Post;
        cdsAux.Next;
        end;
      end;
    end;
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TfrmDelPorcentagemSegreg.LookupImoveisxMestre(iIdImovelMestre: Integer): OLEVariant;
var
  sSQL : string;
begin

 sSql := ' SELECT DISTINCT I.IDIMOVEL,                                            ' +#13+
         '                  I.IMONOME AS NOME,                                    ' +#13+
         '                  I.IMOCODIGO AS CODIGO                                ' +#13+
         '             FROM IMOVEL I, IMOVEL IM                                   ' +#13+
         '            WHERE IM.IDIMOVEL = ' + IntToStr(iIdImovelMestre)             +#13+
         '              AND I.IDIMOVELMESTRE = IM.IDIMOVEL                        ' +#13+
         '  ORDER BY I.IDIMOVEL' ;

  Result := CtrlImovel.GetDataPacket(sSQL);
end;

procedure TfrmDelPorcentagemSegreg.btnDelImovelClick(Sender: TObject);
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

procedure TfrmDelPorcentagemSegreg.SeparaVigencia;
var
sIdImoveis : String;
begin
   sIdImoveis := '';

   cdsDesfazVigencia.Data := CtrlImovel.GetDataPacket('SELECT I.IDIMOVEL,' + #13#10 +
                                                      '       I.IMONOME AS NOMEIMOVEL,' + #13#10 +
                                                      '       I.IMOCODIGO AS CODIGO,' + #13#10 +
                                                      '       P.DATAVIGENCIA AS DATA' + #13#10 +
                                                      '  FROM IMOVEL I, PLANOPATROXVIGENCIAIMOB P' + #13#10 +
                                                      ' WHERE I.IDIMOVEL = P.IDIMOVEL' + #13#10 +
                                                      '   AND I.IDIMOVEL = -1');

   cdsVigenciaBloqueada.Data := CtrlImovel.GetDataPacket('SELECT I.IMONOME AS NOMEIMOVEL,' + #13#10 +
                                                         '       I.IMOCODIGO AS CODIGO,' + #13#10 +
                                                         '       P.DATAVIGENCIA AS DATA,' + #13#10 +
                                                         '       0 AS OBSERVACAO ' + #13#10 +
                                                         '  FROM IMOVEL I, PLANOPATROXVIGENCIAIMOB P' + #13#10 +
                                                         ' WHERE I.IDIMOVEL = P.IDIMOVEL' + #13#10 +
                                                         '   AND I.IDIMOVEL = -1');


//   cdsDesfazVigencia.Data := CtrlImovel.GetDataPacket(' SELECT ''              '' AS DATA,                 '+#13+
//                                                      '        0 AS IDIMOVEL,                              '+#13+
//                                                      '        ''              '' AS CODIGO,               '+#13+
//                                                      '  ''                                                                                        '' AS NOMEIMOVEL '+#13+
//                                                      '             FROM DUAL                              '+#13+
//                                                      '             WHERE 1=2 ');
//
//   cdsVigenciaBloqueada.Data :=CtrlImovel.GetDataPacket(' SELECT ''              '' AS DATA,                '+#13+
//                                                      '          ''              '' AS CODIGO,              '+#13+
//                                                      '  ''                                                                                         '' AS NOMEIMOVEL, '+#13+
//                                                      '              0    AS OBSERVACAO                     '+#13+
//                                                      '             FROM DUAL                               '+#13+
//                                                      '             WHERE 1=2 ');

   cdsImovel.First;
   while not cdsImovel.Eof do
   begin
      if sIdImoveis = '' then
         sIdImoveis := cdsImovel.FieldByName('IDIMOVEL').asString
         else
        sIdImoveis := sIdImoveis + ', ' + cdsImovel.FieldByName('IDIMOVEL').asString;
      cdsImovel.Next;
   end;

   if Trim(sIdImoveis) <> '' then
   begin
//      cdsVigencias.Data := MontaVigencias(sIdImoveis)
      qryVigencias.Close;
      qryVigencias.SQL.Clear;
      qryVigencias.SQL.Add(MontaVigencias(sIdImoveis));
      qryVigencias.Open;
   end
   else
      Exit;

   qryVigencias.First;
   while not qryVigencias.Eof do
   begin
      if (qryVigenciasDATA.AsDateTime >= dDataVigente) and (dtpVigenciaFinal.DateTime > 0)  then
      begin
             if (qryVigenciasDATA.AsDateTime >= dDataVigente) and
                (qryVigenciasDATA.AsDateTime <= dtpVigenciaFinal.DateTime) and
                (qryVigenciasDATA.AsDateTime = qryVigenciasMAXDATA.AsDateTime ) then
             begin
               cdsDesfazVigencia.Append;
               cdsDesfazVigencia.FieldByName('DATA').AsDateTime := qryVigenciasDATA.AsDateTime;
               cdsDesfazVigencia.FieldByName('IDIMOVEL').AsInteger := qryVigenciasIDIMOVEL.AsInteger;
               cdsDesfazVigencia.FieldByName('CODIGO').AsString := qryVigenciasCODIGO.AsString;
               cdsDesfazVigencia.FieldByName('NOMEIMOVEL').AsString := qryVigenciasNOME.AsString;
               cdsDesfazVigencia.Post;
             end
             else
             begin// se a data final não estiver preenchida vai gravar no cds se a data for maior
                cdsVigenciaBloqueada.Append;
                cdsVigenciaBloqueada.FieldByName('DATA').AsDateTime := qryVigenciasDATA.AsDateTime;
                cdsVigenciaBloqueada.FieldByName('CODIGO').AsString := qryVigenciasCODIGO.AsString;
                cdsVigenciaBloqueada.FieldByName('NOMEIMOVEL').AsString := qryVigenciasNOME.AsString;

                if qryVigenciasDATA.AsDateTime < dDataVigente then
                   cdsVigenciaBloqueada.FieldByName('OBSERVACAO').AsInteger := 1
                else
                  if (dtpVigenciaFinal.Date >0 ) then
                    if dtpVigenciaFinal.Date < qryVigenciasMAXDATA.AsDateTime then
                      cdsVigenciaBloqueada.FieldByName('OBSERVACAO').AsInteger := 2;
                cdsVigenciaBloqueada.Post;
             end;
      end
      else
      begin
         if (qryVigenciasDATA.AsDateTime >= dDataVigente) and
            (qryVigenciasDATA.AsDateTime = qryVigenciasMAXDATA.AsDateTime)then
         begin
             cdsDesfazVigencia.Append;
             cdsDesfazVigencia.FieldByName('DATA').AsDateTime := qryVigenciasDATA.AsDateTime;
             cdsDesfazVigencia.FieldByName('IDIMOVEL').AsInteger := qryVigenciasIDIMOVEL.AsInteger;
             cdsDesfazVigencia.FieldByName('CODIGO').AsString := qryVigenciasCODIGO.AsString;
             cdsDesfazVigencia.FieldByName('NOMEIMOVEL').AsString := qryVigenciasNOME.AsString;
             cdsDesfazVigencia.Post;
         end
         else
             begin// se a data final não estiver preenchida vai gravar no cds se a data for maior
                cdsVigenciaBloqueada.Append;
                cdsVigenciaBloqueada.FieldByName('DATA').AsDateTime := qryVigenciasDATA.AsDateTime;
                cdsVigenciaBloqueada.FieldByName('CODIGO').AsString := qryVigenciasCODIGO.AsString;
                cdsVigenciaBloqueada.FieldByName('NOMEIMOVEL').AsString := qryVigenciasNOME.AsString;


                if (dtpVigenciaFinal.Date >0 ) then
                begin
                   if qryVigenciasDATA.AsDateTime < dDataVigente then
                      cdsVigenciaBloqueada.FieldByName('OBSERVACAO').AsInteger := 1
                   else
                   begin
                      if (qryVigenciasDATA.AsDateTime < dtpVigenciaFinal.Date) and
                         (dtpVigenciaFinal.Date < qryVigenciasMAXDATA.AsDateTime) then
                         cdsVigenciaBloqueada.FieldByName('OBSERVACAO').AsInteger := 2;
                   end;
                end
                else
                begin
                   if qryVigenciasDATA.AsDateTime < dDataVigente then
                      cdsVigenciaBloqueada.FieldByName('OBSERVACAO').AsInteger := 1
                   else
                   begin
                      if (qryVigenciasDATA.AsDateTime < qryVigenciasMAXDATA.AsDateTime) then
                         cdsVigenciaBloqueada.FieldByName('OBSERVACAO').AsInteger := 2;
                   end;
                end;



                cdsVigenciaBloqueada.Post;
             end;
      end;

      qryVigencias.Next;
   end;

end;


Function TfrmDelPorcentagemSegreg.AcertaLista(const pCampo,pLista : String) : String;
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

procedure TfrmDelPorcentagemSegreg.bbtnSelTodosEstabClick(Sender: TObject);
begin
  inherited;
  cdsImovel.First;
  while not cdsImovel.Eof do
  begin
     if cdsImovelSEL.AsString = 'N' then
     begin
        cdsImovel.Edit;
        cdsImovel.FieldByName('SEL').AsString := 'S';
        cdsImovel.Post;
     end;
     cdsImovel.Next;
  end;
  cdsImovel.First;

end;

procedure TfrmDelPorcentagemSegreg.bbtnInverteSelEstabClick(
  Sender: TObject);
begin
  inherited;
  cdsImovel.First;
  while not cdsImovel.Eof do
  begin
     if cdsImovelSEL.AsString = 'N' then
     begin
        cdsImovel.Edit;
        cdsImovel.FieldByName('SEL').AsString := 'S';
        cdsImovel.Post;
     end
     else
     begin
        cdsImovel.Edit;
        cdsImovel.FieldByName('SEL').AsString := 'N';
        cdsImovel.Post;
     end;
     cdsImovel.Next;
  end;
  cdsImovel.First;
end;

procedure TfrmDelPorcentagemSegreg.rgAplicarPercClick(Sender: TObject);
begin
  inherited;
  case rgAplicarPerc.ItemIndex of
    0: begin
        cboTipoImovel.Visible := True;
       end;
    1: begin
        cboTipoImovel.Visible := False;
       end;
    2: begin
        cboTipoImovel.Visible := False;
       end;
  end;
end;

procedure TfrmDelPorcentagemSegreg.ntbPrincipalPageChanged(
  Sender: TObject);
begin
  inherited;
  case ntbPrincipal.PageIndex of
    0:
    begin
      BtnVoltar.Visible := False;
      btnOK.Visible := False;
    end;
    1:
    begin
       BtnVoltar.Visible := True;
       btnOK.Visible := False;
    end;
    2:
    begin
       BtnVoltar.Visible := True;
       btnOK.Visible := True;
       BtnContinuar.Visible := False;
    end;
  end;//end case
end;

procedure TfrmDelPorcentagemSegreg.bbtnSairClick(Sender: TObject);
begin
  inherited;
  FechaQueries;
end;

procedure TfrmDelPorcentagemSegreg.btnOKClick(Sender: TObject);
begin
  inherited;
  if cdsDesfazVigencia.IsEmpty then
  begin
     MessageDlg('Não existem vigências para serem desfeitas!', mtWarning, [mbOK], 0);
     Exit;
  end
  else
  begin

   DeletaInsereImoveis;

  end;// end else
end;


procedure  TfrmDelPorcentagemSegreg.DeletaInsereImoveis;
var
qryAux,qryImob,qryBem,qryImovelBem  : TQuery;
i, cont : integer;
begin
   qryAux      := TQuery.Create(nil);
   qryImob     := TQuery.Create(nil);
   qryBem      := TQuery.Create(nil);
   qryImovelBem:= TQuery.Create(nil);
   i := 0;
   cont := 0;

   try
      qryAux.DatabaseName := 'BaseDados';
      qryImob.DatabaseName := 'BaseDados';
      qryBem.DatabaseName := 'BaseDados';
      qryImovelBem.DatabaseName := 'BaseDados';
      Try
        CtrlImovel.CreateThreadProgresso;
        CtrlImovel.StartTransaction;
        cont := cdsDesfazVigencia.Recordcount;
        frmProgresso.Cancelou := False;


        cdsDesfazVigencia.First;
        while not (cdsDesfazVigencia.Eof) and (not frmProgresso.Cancelou) do
        begin
            Inc(i);
//            frmProgresso.MostraFormProgresso('Atualizando registro de Segregação do Imóvel '
//                                              +cdsDesfazVigencia.FieldByName('NOMEIMOVEL').asString + '... ',True,True,True,i,cont);
            qryImob.Close;
            qryImob.SQL.Clear;
            qryImob.SQL.Add('DELETE FROM PLANOPATROXVIGENCIAIMOB     ');
            qryImob.SQL.Add('    WHERE IDIMOVEL = :PIDIMOVEL ');
            qryImob.SQL.Add('      AND DATAVIGENCIA >= TO_DATE(:PDATAVIGENCIAINICIAL, ''DD/MM/YYYY'') ');
            qryImob.Prepare;
            qryImob.ParamByName('PIDIMOVEL').AsString := cdsDesfazVigencia.FieldByName('IDIMOVEL').AsString;
            qryImob.ParamByName('PDATAVIGENCIAINICIAL').AsString := cdsDesfazVigencia.FieldByName('DATA').AsString;

            if dtpVigenciaFinal.Date > 0 then
            begin
              qryImob.SQL.Add(' AND DATAVIGENCIA <= TO_DATE(:PDATAVIGENCIAFINAL, ''DD/MM/YYYY'') ');
              qryImob.Prepare;
              qryImob.ParamByName('PDATAVIGENCIAFINAL').AsString := DateToStr(dtpVigenciaFinal.Date);
            end;
            qryImob.ExecSQL;


            qryBem.Close;
            qryBem.SQL.Clear;
            qryBem.SQL.Add('DELETE FROM PLANOPATROXIMOVEL ');
            qryBem.SQL.Add('         WHERE IDIMOVEL = :PIDIMOVEL  ');
            qryBem.Prepare;
            qryBem.ParamByName('PIDIMOVEL').AsString := cdsDesfazVigencia.FieldByName('IDIMOVEL').AsString;
            qryBem.ExecSQL;


            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT IDBEM FROM IMOVELXBEM          ');
            qryAux.SQL.Add('         WHERE IDIMOVEL = :PIDIMOVEL  ');
            qryAux.Prepare;
            qryAux.ParamByName('PIDIMOVEL').AsString := cdsDesfazVigencia.FieldByName('IDIMOVEL').AsString;
            qryAux.Open;


            if not qryAux.IsEmpty then
            begin
               while not qryAux.Eof do
               begin
                  qryImovelBem.Close;
                  qryImovelBem.SQL.Clear;
                  qryImovelBem.SQL.Add('DELETE FROM PLANOPATROXBEM ');
                  qryImovelBem.SQL.Add('         WHERE IDBEM = :PIDBEM  ');
                  qryImovelBem.Prepare;
                  qryImovelBem.ParamByName('PIDBEM').AsString := qryAux.FieldByName('IDBEM').AsString;
                  qryImovelBem.ExecSQL;

                  qryAux.Next;
               end;
            end;




            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT IDIMOVEL,IDPATRO,IDPLANOPREV,PERCENTRATEIO,(''P'') AS FLGTIPO FROM PLANOPATROXVIGENCIAIMOB P  ');
            qryAux.SQL.Add('         WHERE P.IDIMOVEL = :PIDIMOVEL                                          ');
            qryAux.SQL.Add(' AND P.DATAVIGENCIA = (SELECT  MAX(DATAVIGENCIA) FROM PLANOPATROXVIGENCIAIMOB WHERE IDIMOVEL = :PIDIMOVEL)');
            qryAux.Prepare;
            qryAux.ParamByName('PIDIMOVEL').AsString := cdsDesfazVigencia.FieldByName('IDIMOVEL').AsString;
            qryAux.Open;

            if not qryAux.IsEmpty then
            begin
               while not qryAux.Eof do
               begin
                  qryBem.Close;
                  qryBem.SQL.Clear;
                  qryBem.SQL.Add('INSERT INTO PLANOPATROXIMOVEL (IDIMOVEL,IDPATRO,IDPLANOPREV,PPIPERCENTRATEIO,FLGTIPO) VALUES ');
                  qryBem.SQL.Add('  (:PIDIMOVEL,:PIDPATRO,:PIDPLANOPREV,:PPERCENTRATEIO,:FLGTIPO) ');
                  qryBem.Prepare;
                  qryBem.ParamByName('PIDIMOVEL').AsString := qryAux.FieldByName('IDIMOVEL').AsString;
                  qryBem.ParamByName('PIDPATRO').AsString := qryAux.FieldByName('IDPATRO').AsString;
                  qryBem.ParamByName('PIDPLANOPREV').AsString := qryAux.FieldByName('IDPLANOPREV').AsString;
                  qryBem.ParamByName('PPERCENTRATEIO').AsString := qryAux.FieldByName('PERCENTRATEIO').AsString;
                  qryBem.ParamByName('FLGTIPO').AsString := qryAux.FieldByName('FLGTIPO').AsString;
                  qryBem.ExecSQL;

                  qryAux.Next;
               end;
            end;


            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('SELECT PI.IDPLANOPREV, PI.IDPATRO, I.IDBEM, I.IDPESSOA, PI.PPIPERCENTRATEIO ');
            qryAux.SQL.Add('  FROM IMOVELXBEM I, PLANOPATROXIMOVEL PI ');
            qryAux.SQL.Add(' WHERE PI.IDIMOVEL = I.IDIMOVEL ');
            qryAux.SQL.Add('   AND PI.IDIMOVEL = :PIDIMOVEL ');
            qryAux.Prepare;
            qryAux.ParamByName('PIDIMOVEL').AsString := cdsDesfazVigencia.FieldByName('IDIMOVEL').AsString;
            qryAux.Open;


            if not qryAux.IsEmpty then
            begin
               while not qryAux.Eof do
               begin
                  qryImovelBem.Close;
                  qryImovelBem.SQL.Clear;
                  qryImovelBem.SQL.Add('INSERT INTO PLANOPATROXBEM (IDPLANOPREV,IDPATRO,IDBEM,IDPESSOA,PPBPERCRATEIO) VALUES ');
                  qryImovelBem.SQL.Add('  (:PIDPLANOPREV,:PIDPATRO,:PIDBEM,:PIDPESSOA,:PPPBPERCRATEIO)');
                  qryImovelBem.Prepare;
                  qryImovelBem.ParamByName('PIDPLANOPREV').AsString := qryAux.FieldByName('IDPLANOPREV').AsString;
                  qryImovelBem.ParamByName('PIDPATRO').AsString := qryAux.FieldByName('IDPATRO').AsString;
                  qryImovelBem.ParamByName('PIDBEM').AsString := qryAux.FieldByName('IDBEM').AsString;
                  qryImovelBem.ParamByName('PIDPESSOA').AsString := qryAux.FieldByName('IDPESSOA').AsString;
                  qryImovelBem.ParamByName('PPPBPERCRATEIO').AsString := qryAux.FieldByName('PPIPERCENTRATEIO').AsString;
                  qryImovelBem.ExecSQL;

                  qryAux.Next;
               end;
            end;

           frmProgresso.AndaFormProgresso(i, cont);
           cdsDesfazVigencia.Next;
        end;// end while
        if frmProgresso.Cancelou then
           Raise Exception.Create('')
        else
        begin
           CtrlImovel.Commit;
           MessageDlg('Deleção realizada com sucesso!', mtInformation, [mbOK], 0);
        end;

      Except
         CtrlImovel.Rollback;
         MessageDlg('Deleção cancelada!', mtWarning, [mbOK], 0);
      end;//end try
   finally
     frmProgresso.EscondeFormProgresso;
     CtrlImovel.FreeThreadProgresso;
     FreeAndNil(qryAux);
     FreeAndNil(qryImob);
     FreeAndNil(qryBem);
     FreeAndNil(qryImovelBem);
   end;
end;

function TfrmDelPorcentagemSegreg.MontaVigencias(sIdImoveis : String): String;
var
  sSQL : string;
begin

    sSQL := ' SELECT * FROM '+#13+
            ' (SELECT DISTINCT I.IDIMOVEL,'+#13+
            ' I.IMONOME AS NOME,'+#13+
            ' I.IMOCODIGO AS CODIGO'+#13+
            ' FROM IMOVEL I WHERE  ' + AcertaLista('I.IDIMOVEL',sIdImoveis)+#13;
    sSQL := sSQL + ') SUB,'+#13+
            ' (SELECT  PV.DATAVIGENCIA AS DATA,MAX(P.DATAVIGENCIA) AS MAXDATA, P.IDIMOVEL'+#13+
            ' FROM PLANOPATROXVIGENCIAIMOB P,'+#13+
            '                 (SELECT P1.DATAVIGENCIA, P1.IDIMOVEL'+#13+
            '                  FROM PLANOPATROXVIGENCIAIMOB P1'+#13+
            '                 WHERE'+#13+
            '                 P1.DATAVIGENCIA >= TO_DATE('+QuotedStr(DateToStr(dtpVigenciaInicial.Date))+',''DD/MM/YYYY'')';
      if dtpVigenciaFinal.Date > 0 then
             sSQL := sSQL + '  AND P1.DATAVIGENCIA <= TO_DATE('+QuotedStr(DateToStr(dtpVigenciaFinal.Date))+',''DD/MM/YYYY'')' +#13;

      sSQL:= sSQL +  ' ) PV WHERE  P.IDIMOVEL = PV.IDIMOVEL'+#13+
            ' GROUP BY P.IDIMOVEL, PV.DATAVIGENCIA) MAXD'+#13;

     if (cboTipoImovel.Text <> '')  and (cboTipoImovel.Visible) and (ntbPrincipal.PageIndex = 1) then
     begin
       sSQL:= sSQL + ',(SELECT IMO.IDIMOVEL,IMO.CODTIPIMOVEL '+#13+
                     '    FROM IMOVEL IMO '+#13+
                     '    WHERE IMO.CODTIPIMOVEL = ' + QuotedStr(dtmLookImobiliario.qryLookTipoImovel.FieldByName('CODTIPIMOVEL').AsString) +#13+
                     ') CODTIP'+#13+
                     ' WHERE MAXD.IDIMOVEL = SUB.IDIMOVEL'+#13+
                     ' CODTIP.IDIMOVEL = SUB.IDIMOVEL'+#13;
     end
     else
     begin
        sSQL:= sSQL + ' WHERE MAXD.IDIMOVEL = SUB.IDIMOVEL'+#13;
     end;
      {sSQL := ' SELECT DISTINCT I.IDIMOVEL,             '+#13+
              '        I.IMONOME AS NOME,      '+#13+
              '        I.IMOCODIGO AS CODIGO,  '+#13+
              '        P.DATAVIGENCIA AS DATA, '+#13+
              '        (SELECT MAX(DATAVIGENCIA)                    '+#13+
              '            FROM PLANOPATROXVIGENCIAIMOB             '+#13+
              '           WHERE I.IDIMOVEL = IDIMOVEL ) AS MAXDATA  '+#13+
              '   FROM IMOVEL I, PLANOPATROXVIGENCIAIMOB P          '+#13+
              '  WHERE I.IDIMOVEL = P.IDIMOVEL                      '+#13+
              '    AND P.DATAVIGENCIA >= TO_DATE('+QuotedStr(DateToStr(dtpVigenciaInicial.Date))+',''DD/MM/YYYY'')';


      if dtpVigenciaFinal.Date > 0 then
             sSQL := sSQL + '  AND DATAVIGENCIA <= TO_DATE('+QuotedStr(DateToStr(dtpVigenciaFinal.Date))+',''DD/MM/YYYY'')' +#13;

      if (cboTipoImovel.Text <> '')  and (cboTipoImovel.Visible) and (ntbPrincipal.PageIndex = 0) then
             sSQL := sSQL + ' AND I.CODTIPIMOVEL = ' + QuotedStr(dtmLookImobiliario.qryLookTipoImovel.FieldByName('CODTIPIMOVEL').AsString) +#13;

      sSQL := sSQL + 'AND ' + AcertaLista('I.IDIMOVEL',sIdImoveis);}

    Result := sSQL;

end;

end.
