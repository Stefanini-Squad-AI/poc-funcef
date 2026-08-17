{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27508
Responsável : Daniel Simões
Data        : 17/03/2008
Descrição   : Ajuste dos Help Contexts...
--------------------------------------------------------------------------------
Rotina..........: bbtnConfirmarClick
N. Sol..........: 137533
N. Kintana......: 831460
Data............: 10/06/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção feita a para exibição do relatório Imóveis Alienados.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelImovAli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, mProposta, mResponsavel, mComprador, mImovel,
  fcCombo, fcColorCombo, wwdbdatetimepicker, CMDateTimePicker, db,
  DBTables, Wwquery, wwdblook, mImovelMestre,
  //Ricardo Cristiano - 16/12/2009 - N. Sol 126228 -  N. Kintana 658712 - Início
  uCtrlPlanPrevContabPatro, dBaseDados, uCMClientDataSet, uCMMath;

type
  TRelImovAli = class(TfrmOkCancelar)
    molProposta1: TmolProposta;
    molComprador1: TmolComprador;
    molResponsavel1: TmolResponsavel;
    GroupBox1: TGroupBox;
    cmdtFim: TCMDateTimePicker;
    rgOrdem: TRadioGroup;
    molImovel2: TmolImovel;
    GroupBox2: TGroupBox;
    dblcbEstado: TwwDBLookupCombo;
    qryLookEstado: TwwQuery;
    qryLookEstadoCODESTADO: TStringField;
    qryLookEstadoNOMEESTADO: TStringField;
    qryLookEstadoIDPAIS: TFloatField;
    qryLookEstadoIDESTADO: TFloatField;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;
    cbComprador: TCheckBox;
    cmdtIni: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    molImovelMestre1: TmolImovelMestre;
    rgTipo: TRadioGroup;
    lblPlano: TLabel;
    Label4: TLabel;
    dbcboPlanoContabil: TwwDBLookupCombo;
    dbcboPatro: TwwDBLookupCombo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

   //Ricardo Cristiano - 16/12/2009 - N. Sol 126228 -  N. Kintana 658712
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    // Felipe de Oliveira 14/04/2010 - Sol 131665 ktn 755004
    Function ProcuraDatasVigencia(dDataFinal : TDateTime) : Boolean;
            
    procedure AjustaGrupo;
  public
    { Public declarations }
  end;

var
  RelImovAli: TRelImovAli;

implementation

uses DRelFinanc, uFuncoesImob,
     //Ricardo Cristiano - 16/12/2009 - N. Sol 126228 -  N. Kintana 658712
     dLookImobiliario, uSistema, uMensErro, {uCMMath, uCMClientDataSet,} uCmControlObject;
     

{$R *.DFM}

procedure TRelImovAli.AjustaGrupo;
begin
   if cbComprador.Checked then begin
      dtmRelFinanc.pplComprador3.Visible  := True;
      dtmRelFinanc.ppdbComprador3.Visible := True;
   end else begin
      dtmRelFinanc.pplComprador3.Visible  := False;
      dtmRelFinanc.ppdbComprador3.Visible := False;
   end;
end;

procedure TRelImovAli.bbtnConfirmarClick(Sender: TObject);
var
  _cds : TCMClientDataSet;
  i : integer;
  dTotVlrVenda, dTotVlrContabil, dTotVlrResultado, dPercent, dTot : double;
begin
  inherited;
  _cds := TCMClientDataSet.Create(nil);
  i := 1;
  dTotVlrVenda := 0;
  dTotVlrContabil := 0;
  dTotVlrResultado := 0;
  dTot := 0;

   if (trim(cmDtIni.Text) = '') or (trim(cmDtFim.Text) = '') then
   begin
    MsgDlg('É necessário informar o perído inicial e final para a consulta.',
            'Informação', mtInformation, [mbOK], 0);
     ModalResult := mrNone;
     dbcboPatro.SetFocus;
     Exit;
   end;

   //Ricardo Cristiano - 16/12/2009 - N. Sol 126228 -  N. Kintana 658712
   if (trim(dbcboPlanoContabil.Text) <> '') and (trim(dbcboPatro.Text) = '') then
   begin
     MsgDlg('Como o plano contábil foi selecionado, a patrocinadora também deve ser. ' +#13#10+
            'Favor selecione a patrocinadora ou não selecione nenhum dos dois campos.',
            'Informação', mtInformation, [mbOK], 0);
     ModalResult := mrNone;
     dbcboPatro.SetFocus;
     Exit;
   end;

   // Felipe de Oliveira 14/04/2010 - Sol 131665 ktn 755004
   if ProcuraDatasVigencia(cmdtFim.Date) then
   begin
     MessageDlg('Para este período existem mais de um percentual de segregação vigente. '+#13+#10+
         'O relatório considerará o percentual vigente na data final.', mtInformation, [mbOK], 0);
   end;   

   //Ricardo Cristiano - 16/12/2009 - N. Sol 126228 -  N. Kintana 658712
   if (dbcboPatro.Text <> '') and (dbcboPlanoContabil.Text <> '') then
   begin
     if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(StrToInt(dbcboPatro.LookupValue),
                                                     StrToInt(dbcboPlanoContabil.LookupValue)) then
     begin
       MsgDlg(CtrlPlanPrevContabPatro.MessageInfo, 'Informação', mtInformation, [mbOK], 0);
       ModalResult := mrNone;
       dbcboPlanoContabil.SetFocus;
       Exit;
     end;
   end;
  //Cássio - SOL Nº 137533  KINTANA Nº 831460 - Início
  AjustaGrupo;
  LimpaParametros(dtmRelFinanc.qryImovAli);
  //Ricardo Cristiano - 16/12/2009 - N. Sol 126228 -  N. Kintana 658712
  //LimpaParametros(dtmRelFinanc.cdsImovAliDET);
  dtmRelFinanc.cdsImovAliDET.EmptyDataset;  
  //LimpaParametros(dtmRelFinanc.cdsImovAliTOT);
  with dtmRelFinanc do begin
     //Ricardo Cristiano - 16/12/2009 - N. Sol 126228 -  N. Kintana 658712
     if dbcboPlanoContabil.LookupValue = '' then
       lblPlanoContabil.Caption := 'Plano : < Todos >'
     else
       lblPlanoContabil.Caption := 'Plano : < ' + dbcboPlanoContabil.Text +' >';

     //Ricardo Cristiano - 16/12/2009 - N. Sol 126228 -  N. Kintana 658712
     if dbcboPatro.LookupValue = '' then
       lblPatro.Caption := 'Patrocinadora : < Todos >'
     else
       lblPatro.Caption := 'Patrocinadora : < ' + dbcboPatro.Text +' >';

     if molProposta1.iProposta > 0 then
        qryImovAli.ParamByName('pIDCONTRATOIMOVEL').AsFloat := molProposta1.iProposta;
     if molComprador1.iComprador > 0 then
        qryImovAli.ParamByName('pIDCOMPRADOR').AsFloat := molComprador1.iComprador;
     if molResponsavel1.iResponsavel > 0 then
        qryImovAli.ParamByName('pIDRESPONSAVEL').AsFloat := molResponsavel1.iResponsavel;
     if molImovelMestre1.iMestre > 0 then
        qryImovAli.ParamByName('pIDIMOVELMESTRE').AsFloat := molImovelMestre1.iMestre;
     if molImovel2.iImovel > 0 then
        qryImovAli.ParamByName('pIDIMOVEL').AsFloat := molImovel2.iImovel;
     if cmdtIni.Text <> '' then
        qryImovAli.ParamByName('pDTINI').AsString := cmdtIni.Text;
     if cmdtFim.Text <> '' then
        qryImovAli.ParamByName('pDTFIM').AsString := cmdtFim.Text;
     if dblcbEstado.Value <> '' then
        qryImovAli.ParamByName('pUF').AsString := dblcbEstado.Value;

      if rgTipo.ItemIndex = 0 then
         qryImovAli.ParamByName('PFLGTIPOCONTRATO').AsString  := 'C'
      else
         qryImovAli.ParamByName('PFLGTIPOCONTRATO').AsString  := 'A';

      if dbcboPlanoContabil.Text <> '' then
        qryImovAli.ParamByName('IDPLANOPREV').AsInteger := StrToInt(dbcboPlanoContabil.LookupValue);

      if dbcboPatro.Text <> '' then
        qryImovAli.ParamByName('IDPATRO').AsInteger     := StrToInt(dbcboPatro.LookupValue);

     qryImovAli.ParamByName('pORDEM').AsInteger   := rgOrdem.ItemIndex;
     qryImovAli.Open;

     qryImovAli.First;
     

     while not qryImovAli.Eof do
     begin
      dTotVlrVenda := 0;
      dTotVlrContabil := 0;
      dTotVlrResultado := 0;
      _cds.Data := CtrlPlanPrevContabPatro.GetDataPacket('SELECT PES.NOME AS NOMEPATR, PLN.NOME AS NOMPLANPREV,PPI.IDPLANOPREV, '+
                                      '       PPI.IDPATRO, IMO.IDIMOVEL, IMO.IDIMOVELMESTRE, ' +
                                      '       PPI.PERCENTRATEIO  AS PERCENTRATEIO '+
                                      '  FROM IMOVEL IMO, PESSOA PES, PLANPREVCONTABIL PLN, '+
                                      '       PLANOPATROXVIGENCIAIMOB PPI '+
                                      ' WHERE PES.IDPESSOA = PPI.IDPATRO ' +
                                      '   AND PLN.IDPLANOPREV = PPI.IDPLANOPREV '+
                                      '   AND IMO.IDIMOVEL = ' + qryImovAli.FieldByName('IDIMOVEL').asString +
                                      '   AND PPI.IDIMOVEL = IMO.IDIMOVEL ' +
                                      '   AND PPI.DATAVIGENCIA =  (SELECT MAX(DATAVIGENCIA) AS DATAVIGENCIA ' +
                                      '                              FROM PLANOPATROXVIGENCIAIMOB '+
                                      '                              WHERE IDIMOVEL = ' + qryImovAli.FieldByName('IDIMOVEL').asString +
                                      '                                AND DATAVIGENCIA <= ' + QuotedStr(cmdtFim.Text) +')' +
                                      ' ORDER BY PPI.IDPLANOPREV' );

      while not _cds.Eof do
      begin
        if not cdsImovAliDET.Locate('IDIMOVELMESTRE;IDPATRO;IDPLANOPREV', VarArrayOf([
                  qryImovAli.FieldByName('IDIMOVELMESTRE').Value,
                  _cds.FieldByName('IDPATRO').Value,
                  _cds.FieldByName('IDPLANOPREV').Value]), []) then
        begin
          cdsImovAliDET.Append;
          cdsImovAliDET.FieldByName( 'NOMPLANPREV' ).Value := _cds.FieldByName( 'NOMPLANPREV' ).Value;
          cdsImovAliDET.FieldByName( 'NOMEPATR' ).Value := _cds.FieldByName( 'NOMEPATR' ).Value;
          cdsImovAliDET.FieldByName( 'IDPLANOPREV' ).Value := _cds.FieldByName( 'IDPLANOPREV' ).Value;
          cdsImovAliDET.FieldByName( 'IDPATRO' ).Value := _cds.FieldByName( 'IDPATRO' ).Value;
          cdsImovAliDET.FieldByName( 'IDIMOVEL' ).Value := _cds.FieldByName( 'IDIMOVEL' ).Value;
          cdsImovAliDET.FieldByName( 'IDIMOVELMESTRE' ).Value := _cds.FieldByName( 'IDIMOVELMESTRE' ).Value;
          cdsImovAliDET.FieldByName( 'PERCENTRATEIO' ).Value := 0;
          if _cds.RecNo = _cds.RecordCount then
          begin
            cdsImovAliDET.FieldByName( 'TOTVLRVENDA' ).Value := qryImovAli.FieldByName( 'VLRVENDA' ).Value - dTotVlrVenda;
            cdsImovAliDET.FieldByName( 'TOTVLRCONTABIL' ).Value := qryImovAli.FieldByName( 'VLRCONTABIL' ).Value - dTotVlrContabil;
            cdsImovAliDET.FieldByName( 'TOTVLRRESULTADO' ).Value := qryImovAli.FieldByName( 'VLRRESULTADO' ).Value - dTotVlrResultado;
          end
          else
          begin
            cdsImovAliDET.FieldByName( 'TOTVLRVENDA' ).AsFloat := RoundCM((qryImovAli.FieldByName( 'VLRVENDA' ).AsFloat * _cds.FieldByName('PERCENTRATEIO').asFloat) /100, 2);
            cdsImovAliDET.FieldByName( 'TOTVLRCONTABIL' ).AsFloat := RoundCM((qryImovAli.FieldByName( 'VLRCONTABIL' ).AsFloat * _cds.FieldByName('PERCENTRATEIO').asFloat) /100, 2);
            cdsImovAliDET.FieldByName( 'TOTVLRRESULTADO' ).AsFloat := RoundCM((qryImovAli.FieldByName( 'VLRRESULTADO' ).AsFloat * _cds.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
          end;
          dTotVlrVenda := dTotVlrVenda + cdsImovAliDET.FieldByName( 'TOTVLRVENDA' ).asFloat;
          dTotVlrContabil := dTotVlrContabil + cdsImovAliDET.FieldByName( 'TOTVLRCONTABIL' ).asFloat;
          dTotVlrResultado := dTotVlrResultado + cdsImovAliDET.FieldByName( 'TOTVLRRESULTADO' ).asFloat;
          cdsImovAliDET.Post;
        end
        else
        begin
          cdsImovAliDET.Edit;
          if _cds.RecNo = _cds.RecordCount then
          begin
            cdsImovAliDET.FieldByName( 'TOTVLRVENDA' ).AsFloat := cdsImovAliDET.FieldByName( 'TOTVLRVENDA' ).AsFloat +
                                                                  (qryImovAli.FieldByName( 'VLRVENDA' ).Value - dTotVlrVenda);
            cdsImovAliDET.FieldByName( 'TOTVLRCONTABIL' ).AsFloat := cdsImovAliDET.FieldByName( 'TOTVLRCONTABIL' ).AsFloat +
                                                                     (qryImovAli.FieldByName( 'VLRCONTABIL' ).Value - dTotVlrContabil);
            cdsImovAliDET.FieldByName( 'TOTVLRRESULTADO' ).AsFloat := cdsImovAliDET.FieldByName( 'TOTVLRRESULTADO' ).AsFloat +
                                                                      (qryImovAli.FieldByName( 'VLRRESULTADO' ).Value - dTotVlrResultado);
          end
          else
          begin
            cdsImovAliDET.FieldByName( 'TOTVLRVENDA' ).AsFloat := cdsImovAliDET.FieldByName( 'TOTVLRVENDA' ).AsFloat +
                                                                  RoundCM((qryImovAli.FieldByName( 'VLRVENDA' ).AsFloat *
                                                                  _cds.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
            cdsImovAliDET.FieldByName( 'TOTVLRCONTABIL' ).AsFloat := CdsImovAliDET.FieldByName( 'TOTVLRCONTABIL' ).AsFloat +
                                                                     RoundCM((qryImovAli.FieldByName( 'VLRCONTABIL' ).AsFloat *
                                                                     _cds.FieldByName('PERCENTRATEIO').asFloat)/ 100, 2);
            cdsImovAliDET.FieldByName( 'TOTVLRRESULTADO' ).AsFloat := cdsImovAliDET.FieldByName( 'TOTVLRRESULTADO' ).AsFloat +
                                                                      RoundCM((qryImovAli.FieldByName( 'VLRRESULTADO' ).AsFloat *
                                                                      _cds.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
            dTotVlrVenda := dTotVlrVenda + RoundCM((qryImovAli.FieldByName( 'VLRVENDA' ).AsFloat * _cds.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
            dTotVlrContabil := dTotVlrContabil + RoundCM((qryImovAli.FieldByName( 'VLRCONTABIL' ).AsFloat * _cds.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
            dTotVlrResultado := dTotVlrResultado + RoundCM((qryImovAli.FieldByName( 'VLRRESULTADO' ).AsFloat * _cds.FieldByName('PERCENTRATEIO').asFloat) /100, 2);
          end;
          cdsImovAliDET.Post;
        end;
        _cds.Next;
      end;
      qryImovAli.Next;
     end;
     dTotVlrVenda := 0;
     dTotVlrContabil := 0;
     dTotVlrResultado := 0;

     cdsImovAliDET.First;

     while not cdsImovAliDET.Eof do
     begin
      if not cdsImovAliTOT.Locate('IDPATRO;IDPLANOPREV', VarArrayOf([
                  cdsImovAliDET.FieldByName('IDPATRO').Value,
                  cdsImovAliDET.FieldByName('IDPLANOPREV').Value]), []) then
      begin
        cdsImovAliTOT.Append;
        cdsImovAliTOT.FieldByName('NOMPLANPREV').Value := cdsImovAliDET.FieldByName('NOMPLANPREV').Value;
        cdsImovAliTOT.FieldByName('NOMEPATR').Value := cdsImovAliDET.FieldByName('NOMEPATR').Value;
        cdsImovAliTOT.FieldByName('IDPLANOPREV').Value := cdsImovAliDET.FieldByName('IDPLANOPREV').Value;
        cdsImovAliTOT.FieldByName('IDPATRO').Value := cdsImovAliDET.FieldByName('IDPATRO').Value;
        cdsImovAliTOT.FieldByName('PERCENTRATEIO').Value := cdsImovAliDET.FieldByName('PERCENTRATEIO').Value;
        cdsImovAliTOT.FieldByName('TOTVLRVENDA').Value := cdsImovAliDET.FieldByName('TOTVLRVENDA').Value;
        cdsImovAliTOT.FieldByName('TOTVLRCONTABIL').Value := cdsImovAliDET.FieldByName('TOTVLRCONTABIL').Value;
        cdsImovAliTOT.FieldByName('TOTVLRRESULTADO').Value := cdsImovAliDET.FieldByName('TOTVLRRESULTADO').Value;
      end
      else
      begin
        cdsImovAliTOT.edit;
        cdsImovAliTOT.FieldByName('TOTVLRVENDA').Value := cdsImovAliTOT.FieldByName('TOTVLRVENDA').Value +
                                                          cdsImovAliDET.FieldByName('TOTVLRVENDA').Value;
        cdsImovAliTOT.FieldByName('TOTVLRCONTABIL').Value := cdsImovAliTOT.FieldByName('TOTVLRCONTABIL').Value +
                                                             cdsImovAliDET.FieldByName('TOTVLRCONTABIL').Value;
        cdsImovAliTOT.FieldByName('TOTVLRRESULTADO').Value := cdsImovAliTOT.FieldByName('TOTVLRRESULTADO').Value +
                                                              cdsImovAliDET.FieldByName('TOTVLRRESULTADO').Value;
      end;
      cdsImovAliDET.Next;
     end;
     
      cdsImovAliTOT.First;
      while not cdsImovAliTOT.Eof do
      begin
        dTot := dTot + cdsImovAliTOT.FieldByName('TOTVLRVENDA').asFloat;
        cdsImovAliTOT.Next;
      end;

      cdsImovAliTOT.First;
      dPercent := 0;
      while not cdsImovAliTOT.Eof do
      begin
        cdsImovAliTOT.Edit;
        if cdsImovAliTOT.RecNo = cdsImovAliTOT.RecordCount then
          cdsImovAliTOT.FieldByName('PERCENTRATEIO').asFloat := Abs(100 - dPercent)
        else
          cdsImovAliTOT.FieldByName('PERCENTRATEIO').asFloat := Abs(RoundCM((cdsImovAliTOT.FieldByName('TOTVLRVENDA').asFloat * 100)/
                                                                        dTot,2));
        dPercent := dPercent +  cdsImovAliTOT.FieldByName('PERCENTRATEIO').asFloat;
        cdsImovAliTOT.Post;
        cdsImovAliTOT.Next;
      end;

  end;
  //Cássio - SOL Nº 137533  KINTANA Nº 831460 - Fim
  dtmRelFinanc.bSeparador := chkLinhas.Checked;
  // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
  dtmRelFinanc.bCorlinha   := chkCorLinha.Checked;
  dtmRelFinanc.CorLinha    := cboCorLinha.SelectedColor;
  FreeAndNil(_cds);
end;

// Felipe de Oliveira 14/04/2010 - Sol 131665 ktn 755004
Function TRelImovAli.ProcuraDatasVigencia(dDataFinal : TDateTime) : Boolean;
var
qQueryVigencia : TQuery;
sql : String;
begin
  Result := False;
  qQueryVigencia := TQuery.Create(nil);
  qQueryVigencia.DatabaseName := 'BASEDADOS';

  sql := 'SELECT COUNT (DISTINCT PPI.DATAVIGENCIA) FROM PLANOPATROXVIGENCIAIMOB PPI ' + #13+
         ' WHERE PPI.DATAVIGENCIA <= ' + QuotedStr(DateToStr(dDataFinal));

  qQueryVigencia.Close;
  qQueryVigencia.SQL.Add(sql);
  qQueryVigencia.Open;

  if qQueryVigencia.Fields[0].AsInteger > 1 then
   Result := True;
end;

procedure TRelImovAli.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,False,Sender);
end;

procedure TRelImovAli.FormShow(Sender: TObject);
begin
   inherited;
   cmDtFim.Date      := Date();
   cmDtIni.Date      := Date();
   rgOrdem.ItemIndex := 0;
   qryLookEstado.Open;

   dtmLookImobiliario.qryLookPlanoPrev.Open;
   LimpaParametros(dtmLookImobiliario.qryLookPatrocinadora);
   dtmLookImobiliario.qryLookPatrocinadora.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   dtmLookImobiliario.qryLookPatrocinadora.Open;
   
end;

procedure TRelImovAli.FormActivate(Sender: TObject);
begin
  inherited;
   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   CtrlPlanPrevContabPatro.Initialize(dtmBaseDados.dbBaseDados,True);
end;

procedure TRelImovAli.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlPlanPrevContabPatro.Free;
end;

end.
