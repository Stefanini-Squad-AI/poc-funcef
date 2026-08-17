unit FBaixaCPMFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit,
  Db, DBTables, Wwquery, CMDBLookupCombo, wwdblook, uCmSqlParams, DBClient,
  uCMClientDataSet, uCtrlDocumento, uctrlLancamento, uctrlPadroes,
  uCtrlPlacontasCapCar, uCtrlParamIntegra, uCtrlPlanPrevContabPatro;
 {andré tavares - pendência 24417 - 05/02/2007}

type
  TFrmBaixaCPMFMT = class(TfrmOkCancelar)
    Label5: TLabel;
    DtProgBaixaF: TCMDateTimePicker;
    Label1: TLabel;
    RevalCpmf: TRealEdit;
    CkbArredonda: TCheckBox;
    Bevel1: TBevel;
    GbLancaAjuste: TGroupBox;
    lblUnidNegoc: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    lblCentroRespon: TLabel;
    dblcCentroRespon: TwwDBLookupCombo;
    lblTipoRD: TLabel;
    dblcTipoRD: TwwDBLookupCombo;
    CmbCentCusto: TwwDBLookupCombo;
    Label6: TLabel;
    lblValorDet: TLabel;
    dbeValorDet: TRealEdit;
    Label11: TLabel;
    CmbPlano: TCMDBLookupCombo;
    CmbPatro: TCMDBLookupCombo;
    Label12: TLabel;
    CmbPrograma: TCMDBLookupCombo;
    Label13: TLabel;
    dblcTipoDoc: TwwDBLookupCombo;
    lblTipoDocum: TLabel;
    lblHistorico: TLabel;
    EdtHistorico: TEdit;
    CdsTipoDoc: TCMClientDataSet;
    CdsUnidNegoc: TCMClientDataSet;
    CdsCentroRespon: TCMClientDataSet;
    CdsTipoRD: TCMClientDataSet;
    CdsCentroCusto: TCMClientDataSet;
    CdsProgramaPrev: TCMClientDataSet;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatroPrev: TCMClientDataSet;
    SQLTipoDoc: TCMSqlParams;
    SQLUnidNegoc: TCMSqlParams;
    SQLCentroRespon: TCMSqlParams;
    sqlTipoRD: TCMSqlParams;
    SQLCentroCusto: TCMSqlParams;
    SQLProgramaPrev: TCMSqlParams;
    SQLPlanoPrev: TCMSqlParams;
    SQLPatroPrev: TCMSqlParams;
    Cds: TCMClientDataSet;
    SQL: TCMSqlParams;
    sqlForn: TCMSqlParams;
    cdsForn: TCMClientDataSet;
    procedure CkbArredondaClick(Sender: TObject);
    procedure dblcTipoRDCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

    sMsgErro        : string; //andré tavares - pendência 24697 - 12/03/2007
    Documento       : TCtrlDocumento;
    Lancamento      : TCtrlLancamento;
    PlacontasCapCar : TCtrlPlacontasCapCar;
    Placontas       : TPlacontas;

    sNomeCentroResponPadrao, sCodCentroResponPadrao: String;
    FcodportForma: Integer;
    FIdfavorecido: LongInt;
    FNumDocLancado: LongInt;
    FmessageInfo: String;
    procedure MontaCentroDeCusto;
    function LancaDocumento :boolean;
    procedure SetcodportForma(const Value: Integer);
    procedure SetIdfavorecido(const Value: LongInt);
    procedure SetNumDocLancado(const Value: LongInt);
    procedure SetmessageInfo(const Value: String);
    { Private declarations }
  public
    property Idfavorecido : LongInt read FIdfavorecido  write SetIdfavorecido;
    property NumDocLancado: LongInt read FNumDocLancado write SetNumDocLancado;
    property codportForma : Integer read FcodportForma  write SetcodportForma; {andré tavares - pendência 24417 - 05/02/2007}
    property messageInfo: String read FmessageInfo write SetmessageInfo;

    { Public declarations }
  end;

var
  FrmBaixaCPMFMT: TFrmBaixaCPMFMT;

implementation

Uses uSistema, uintegraback, uFuncaoGeral, uDataBase, dBaseDados, uMensErro;
     {uDocumento, uLancContab;}

{$R *.DFM}

procedure TFrmBaixaCPMFMT.CkbArredondaClick(Sender: TObject);
Var
  sSql :String;
begin
  inherited;
  GbLancaAjuste.Enabled := CkbArredonda.Checked;

  If Not CdsProgramaPrev.Active Then
  Begin
     SQLProgramaPrev.Open;
     SQLPatroPrev.Open;
     SQLPlanoPrev.Open;

     ssql:='  SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, '+
           '  FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '+
           ' WHERE a.RECPAG =  ''P'''+
           ' and not exists (select 1 from UsuarioxTpdocto b where recpag='+#39+Integraback.recpag+#39+' and b.idusuario='+Inttostr(sistema.IdUsuario)+') '+
           ' union SELECT CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, '+
           ' FLGGERANUMDOC, FLGDOCFISCAL FROM TIPODOCRECPAG a '+
           ' WHERE a.RECPAG =  ''P'' and  exists '+
           ' (select 1 from UsuarioxTpdocto b where recpag='+#39+Integraback.recpag+#39+' and a.codtipdoc=b.codtipdoc  '+
           ' and b.idusuario='+Inttostr(sistema.IdUsuario)+') ORDER BY DEBCRE DESC,DESCRICAO  ';

     SQLTipoDoc.SQL.Text := ssql;
     SQLTipoDoc.Open;

     SQLCentroRespon.SQL.Text :=
       'SELECT CEN.CODCENTRORESPON,CEN.NOME,CEN.ANALITICOSINTET,CEN.CODCENTROCUSTO '+
       'FROM CENTRESPON CEN, PESSOAXCRESP PES '+
       'WHERE (CEN.IDPESSOA = '+InttoStr(Sistema.idempresa)+') AND '+
       '(CEN.CODCENTRORESPON <> ''9999999999'') AND '+
       '(CEN.ATIVO=''S'') AND '+
       '(CEN.CODCENTRORESPON=PES.CODCENTRORESPON) AND '+
       '(PES.IDPESSOAACESSO='+InttoStr(Sistema.IdUsuario)+') '+
       'ORDER BY CEN.CODCENTRORESPON,CEN.ANALITICOSINTET,CEN.NOME';
     SQLCentroRespon.Open;

     if CdsCentroRespon.IsEmpty then
     begin
       SQLCentroRespon.SQL.Text := 'SELECT CODCENTRORESPON,NOME,ANALITICOSINTET, CODCENTROCUSTO FROM CENTRESPON WHERE IDPESSOA = '+InttoStr(Sistema.idempresa)+' AND CODCENTRORESPON = ''9999999999''  and ativo=''S''';
       SQLCentroRespon.Open;

       sNomeCentroResponPadrao := CdsCentroRespon.FieldByName('NOME').AsString;
       sCodCentroResponPadrao  := CdsCentroRespon.FieldByName('CODCENTRORESPON').AsString;

       SQLCentroRespon.SQL.Text :=
         'SELECT CEN.CODCENTRORESPON,CEN.NOME,CEN.ANALITICOSINTET,CEN.CODCENTROCUSTO '+
         'FROM CENTRESPON CEN '+
         'WHERE (CEN.IDPESSOA = '+InttoStr(Sistema.idempresa)+') AND '+
         '(CEN.CODCENTRORESPON <> ''9999999999'') AND '+
         '(CEN.ATIVO=''S'') '+
         'ORDER BY CEN.CODCENTRORESPON,CEN.ANALITICOSINTET,CEN.NOME';
     end;

     SQLUnidNegoc.Prepare;
     SQLUnidNegoc.ParamByName('IDPESSOA').AsFloat := Sistema.idempresa;
     SQLUnidNegoc.Open;

     CdsUnidNegoc.FieldByName('UNECODIGO').EditMask := IntegraBack.MascaraUnidNegoc + ';0;_';
     CdsCentroRespon.FieldByName('CODCENTRORESPON').EditMask := IntegraBack.MascaraCr + ';0;_';


     SQLTipoRD.SQL.Text := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                           'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                           'TIPORECEBDESEMB T, FORNXDESEMB F ' +
                           ' WHERE (T.ANASINT = ''A'') AND ' +
                           '       (T.RECPAG        = ''' + paramintegra.RecPag + ''') AND  ' +
                           '       (T.IDPESSOA      = ' + InttoStr(Sistema.idempresa) + ') AND ' +
                           '       (F.IDPESSOA      = ' + IntToStr(fidfavorecido) + ') AND ' +
                           '       (F.RECPAG        = T.RECPAG) AND  ' +
                           '       (F.IDEMPRESAPROP = T.IDPESSOA) AND ' +
                           '       (T.ATIVO <> ''N'') and ' +
                           '       (F.CODTIPRECDES  = T.CODTIPRECDES) ' +
                           ' ORDER BY T.DESCRICAO';
     SQLTipoRD.Open;

     if CdsTipoRD.IsEmpty then
     begin
        SQLTipoRD.SQL.Text := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                                   'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                                   'TIPORECEBDESEMB T, RAMOXDESEMB R ' +
                                   ' WHERE (T.ANASINT = ''A'') AND ' +
                                   '       (T.RECPAG           = ''' + paramintegra.RecPag + ''') AND  ' +
                                   '       (T.IDPESSOA         = ' + InttoStr(Sistema.idempresa) + ') AND ' +
                                   '       (R.IDRAMOFORNECEDOR IN (SELECT IDRAMOFORNECEDOR FROM FORNXRAMO WHERE IDPESSOA = ' + IntToStr(fidfavorecido) + ')) AND ' +
                                   '       (R.RECPAG           = T.RECPAG)   AND ' +
                                   '       (R.IDPESSOA         = T.IDPESSOA) AND ' +
                                   '       (T.ATIVO <> ''N'') and ' +
                                   '       (R.CODTIPRECDES     = T.CODTIPRECDES) ' +
                                   ' ORDER BY T.DESCRICAO';
        SQLTipoRD.Open;

        if CdsTipoRd.IsEmpty then
        begin
           SQLTipoRD.SQL.Text :=  'SELECT CODTIPRECDES, RECPAG, PLACONTACREDITO, PLANO, PLACONTA, DESCRICAO, ANASINT, FLGOBRIGARESERVA, FLGCALCULAIMPOSTO, HITCODHIST ' +
                                  'FROM TIPORECEBDESEMB WHERE (ANASINT = ''A'') AND (RECPAG = ''' + IntegraBack.RecPag +
                                  ''') AND (IDPESSOA = '+InttoStr(Sistema.idempresa) + ') ' +
                                  ' and (ATIVO <> ''N'') ' +

                                  'ORDER BY DESCRICAO';
           SQLTipoRD.Open;
        end;
     end;

     MontaCentroDeCusto;
  end;
end;

procedure TFrmBaixaCPMFMT.MontaCentroDeCusto;
var
  sSql :string;
begin
  dblcTipoRD.LookupValue := dblcTipoRD.LookupValue;

  if (IntegraBack.Contabilidade <> 'S') then
  begin
     SQLCentroCusto.SQL.Text := 'SELECT DISTINCT CODCENTROCUSTO, NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE ATIVO = ''S'' AND IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' ORDER BY CODCENTROCUSTO, STATUSGRUPOCDC DESC';
     SQLCentroCusto.Open;
  end
  else
  begin
     if not CdsTipoRD.FieldByName('PLACONTA').IsNull then
     begin
       SQL.SQL.Text := 'SELECT PLACCUST FROM PLANOCONTA WHERE PLANO = ' + IntToStr(IntegraBack.Plano) +
                                  ' AND PLACONTA = ''' + Trim(CdsTipoRD.FieldByName('PLACONTA').AsString) + '''';
       SQL.Open;

       if Cds.FieldByName('PLACCUST').AsString = 'S' then
          sSql := 'SELECT DISTINCT CENT.CODCENTROCUSTO,CENT.NOME, CENT.STATUSGRUPOCDC, CENT.IDPROGRAMA FROM CENTCUST CENT '+
                          'WHERE CENT.ATIVO = ''S'' AND CODCENTROCUSTO IN (SELECT CODCENTROCUSTO FROM CONTASxCC CONT '+
                          'WHERE CONT.IDEMPRESA = CENT.IDEMPRESA   AND '+
                          '      CONT.CODCENTROCUSTO= CENT.CODCENTROCUSTO   AND ' +
                          '      CONT.IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa) + ' AND ' +
                          '      CONT.PLANO = ' + InttoStr(IntegraBack.Plano) + ' AND ' +
                          '      RTRIM(CONT.PLACONTA) = '''+ Trim(CdsTipoRD.FieldByName('PLACONTA').AsString) + ''') ORDER BY CENT.CODCENTROCUSTO, CENT.STATUSGRUPOCDC DESC'
       else
          sSql := 'SELECT DISTINCT CODCENTROCUSTO,NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE ATIVO = ''S'' AND IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' ORDER BY CODCENTROCUSTO, STATUSGRUPOCDC DESC';

       SQLCentroCusto.SQL.Text := sSql;
       SQLCentroCusto.Open;

       if Not CdsCentroCusto.IsEmpty then
       begin
         if (not CdsCentroRespon.FieldByName('CODCENTROCUSTO').IsNull) Then 
         begin
           if CdsCentroCusto.Locate('CODCENTROCUSTO', CdsCentroRespon.FieldByName('CODCENTROCUSTO').AsString,[]) then
           begin
             CmbCentCusto.LookupValue      := CdsCentroRespon.FieldByName('CODCENTROCUSTO').AsString;
             CmbCentCusto.DisplayValue     := CdsCentroCusto.FieldByName('NOME').AsString;
           end
           else
             CmbCentCusto.Clear;
         end
         else
         begin
           if (CmbCentCusto.Text <> '') then
           begin
             CmbCentCusto.LookupValue      := CdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
             CmbCentCusto.DisplayValue     := CdsCentroCusto.FieldByName('NOME').AsString;
           end;
         end;
       end
       else
       begin
         SQLCentroCusto.SQL.Text := 'SELECT DISTINCT CODCENTROCUSTO,NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE 1=2';
         SQLCentroCusto.Open;

         if (CmbCentCusto.Text <> '') then
         begin
           CmbCentCusto.LookupValue      := CdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
           CmbCentCusto.DisplayValue     := CdsCentroCusto.FieldByName('NOME').AsString;
         end
         else
           CmbCentCusto.Clear;
       end;
     end
     else
     begin
       sSql := ' SELECT DISTINCT C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC, C.IDPROGRAMA FROM TIPORDXCCXCONTA T, CENTCUST C WHERE C.ATIVO = ''S'' AND ' +
                                      ' (T.RECPAG = ''' + IntegraBack.RecPag + ''') AND ' +
                                      ' (T.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND  ' +
                                      ' (RTRIM(T.CODTIPRECDES) = ''' + Trim(dblcTipoRD.LookupValue) + ''') AND ' +
                                      FuncaoGeral.Decode(CmbPrograma.LookupValue,'','',' (T.IDPROGRAMA = ' +  CmbPrograma.LookupValue + ') AND ') +
                                      ' (T.IDPESSOA = C.IDEMPRESA) AND  ' +
                                      ' (C.CODCENTROCUSTO = T.CODCENTROCUSTO) ORDER BY C.CODCENTROCUSTO, C.STATUSGRUPOCDC DESC';

       SQLCentroCusto.SQl.Text := sSql;
       SQLCentroCusto.Open;

       if CdsCentroCusto.IsEmpty then
       begin
          SQLCentroCusto.SQl.Text := 'SELECT DISTINCT CODCENTROCUSTO, NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENTCUST WHERE ATIVO = ''S'' AND IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' ORDER BY CODCENTROCUSTO, STATUSGRUPOCDC DESC';
          SQLCentroCusto.Open;

          if (CmbCentCusto.Text <> '') then
          begin
            CmbCentCusto.LookupValue      := CdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
            CmbCentCusto.DisplayValue     := CdsCentroCusto.FieldByName('NOME').AsString;
          end
          else
            CmbCentCusto.Clear;
       end;
     end;
  end;
end;


procedure TFrmBaixaCPMFMT.dblcTipoRDCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  MontaCentroDeCusto;
end;

procedure TFrmBaixaCPMFMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := MrCancel;
end;

procedure TFrmBaixaCPMFMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  with TCtrlPlanPrevContabPatro.Create do
  begin
      InitializeAs(Padroes);
      if not ValidaPlanoPatro(strToIntDef(CmbPatro.LookupValue, -1),
                              strToIntDef(CmbPlano.LookupValue, -1)) then
      begin
        MsgDlg(MessageInfo,'Erro',mtError,[mbOk],0);
        free;
        exit;
      end;
  end;

  If CkbArredonda.Checked And
     ((dblcTipoDoc.Text = '') Or
      (dblcUnidNegoc.Text = '') Or
      (dblcCentroRespon.Text = '') Or
      (dblcTipoRD.Text = '') Or
      (CmbCentCusto.Text = '') Or
      (dbeValorDet.Text = '') Or
      (CmbPatro.Text = '') Or
      (CmbPlano.Text = '') Or
      (CmbPrograma.Text = '')) Then
      MsgDlg('Todos os Dados são obrigatórios para o lançamento do Arredondamento da CPMF','Atenção',MtInformation,[MbOk],0)
  Else
     If (DtProgBaixaF.Text = '') Then
        MsgDlg('Favor Informar a Data Programada de Baixa da CPMF','Atenção',MtInformation,[MbOk],0)
     Else
     Begin
        Try
          if not LancaDocumento  Then
          Begin
            MsgDlg(fMessageInfo, 'Arredondamento', mtError, [mbOk], 0);
            ModalResult := MrNone;
            exit;
          End;

          ModalResult := MrOk;
        Except
          ModalResult := MrCancel;
        End;
     End;
     fMessageInfo := '';
end;

function TFrmBaixaCPMFMT.LancaDocumento: Boolean;
Var
  iNumLancto :Integer;
  iCodPortador, liEmpresa, liExercicio, liPeriodo, iPlnCodigo, iPlnCodigoP, iSubContaCliFor: LongInt;
  rValorLancto, rCodLancFinanc, rPlnCodigo: Double;
  rNumDocumento, rHistPadFinan : Extended;
  DataFloat: TDateTime;
  ifloat :integer;
begin
  Result         := true;

  rCodLancFinanc := 0;
  DataFloat      := DtProgBaixaF.Date;
  sMsgErro       := 'Erro ao Lançar Documento de Arredondamento: '; //andré tavares - pendência 24697 - 12/03/2007

  try
    if CkbArredonda.Checked Then
    begin
      //andre tavares - pendência 24713 - 15/03/2007 - não vou mais fazer baixa simultânea, vou lançá-lo normalmente e fazer um lançamento de baixa posteriormente
      Documento.Prepare( OpDocumento, odlEfetivo, sdocBaixado );
      Documento.IdEspAcesso    := sistema.IdEspAcesso;
      Documento.IdUsuario      := sistema.IdUsuario;
      Documento.IdModulo       := sistema.IdModulo;
      Documento.UsaPlanoPatro  := true;
      Documento.SlipAutomatico := false;

      if not PlacontasCapCar.GetPlacontas (CodPortForma, fIdFavorecido, sistema.IdEmpresa,
                       StrToIntDef(CmbPrograma.LookupValue, -1),
                       StrToIntDef(CmbPatro.LookupValue, -1),
                       CmbCentCusto.LookupValue,
                       dblcTipoRD.LookupValue,
                       'P', opldEfetivo, True, PlaContas, paramintegra.IntegraContab, paramintegra.plano) then
      begin
        result := false;
        sMsgErro := PlacontasCapCar.messageinfo; //andré tavares - pendência 24697 - 12/03/2007
        raise exception.create (sMsgErro);
      end;

      if ParamIntegra.IntegraContab then
      begin
        If Not Lancamento.InsereLancaContab('2',
                                      sistema.idempresa,
                                      sistema.idmodulo,
                                      sistema.idUsuario,
                                      paramintegra.plano,
                                      strToIntDef(dblcUnidNegoc.LookupValue, -1),
                                      placontas.iSubContaPass,
                                      placontas.iSubConta,
                                      strToIntDef(CmbPlano.LookupValue, -1),
                                      StrToIntDef(CmbPatro.LookupValue, -1),
                                      0,
                                      0,
                                      dateToStr(date),
                                      '',
                                      EdtHistorico.Text, //andré tavares - pendência 24661 - 12/03/2007
                                      '',
                                      '',
                                      '',
                                      '',
                                      '03',
                                      CmbCentCusto.LookupValue,
                                      placontas.sPlacontaPass,
                                      CmbCentCusto.LookupValue, //andré tavares - pendência 24697 - 12/03/2007
                                      placontas.sPlaconta,
                                      '',
                                      dbeValorDet.Value,
                                      false,
                                      true,
                                      -1,
                                      date) Then
        begin
          result   := false;
          sMsgErro := sMsgErro + Lancamento.MessageInfo; //andré tavares - pendência 24697 - 12/03/2007
          raise exception.create (sMsgErro);
        end;

         iPlnCodigo := Trunc( Lancamento.RetornoPlnCodigo );
         rPlnCodigo := iPlnCodigo;
       end;//if integra contabilidade

      try //andré tavares - pendência 24697 - 12/03/2007
        rNumDocumento := documento.GetSequenceDocumento;

        //Atribui os valores para o Lançamento/ALteração do documento
        Documento.SetValues(trunc(rNumDocumento), rNumDocumento, '', '0', 'P', '2', '', '', Placontas.sPlaconta,
                            CmbCentCusto.LookupValue, //andré tavares - pendência 24697 - 12/03/2007
                            '', '', '', '', '', '', '', '', DtProgBaixaF.date, DtProgBaixaF.date, DtProgBaixaF.date,
                            0, 0, 0, 0, 0, 0, 0, 0, strToInt(dblcTipoDoc.LookupValue), sistema.idempresa, sistema.idmodulo,
                            fIdFavorecido, 0, 0, strToIntDef(dblcUnidNegoc.LookupValue, -1), //andré tavares - pendência 24697 - 12/03/2007
                            paramintegra.plano, 0, 0, 0, 0, 0, sistema.idusuario,
                            sistema.idempresa, 0, 0, placontas.iSubConta,
                            fCodPortForma, //andré tavares - pendência 24620 - 02/03/2007
                            0, 0, 0, -1,'');

        Documento.Lanctodocum.SetValues(DtProgBaixaF.date, 0, 0, dbeValorDet.Value, 0, dbeValorDet.Value,
                                         0, iPlnCodigo, 0, sistema.idusuario, sistema.idempresa, 0, 0,
                                         strToInt(dblcTipoDoc.LookupValue), 0, 0, '2', '', '',
                                         '',
                                         EdtHistorico.Text, //andré tavares - pendência 24661 - 12/03/2007
                                         '', '', '',
                                         'C', sistema.idmodulo, paramintegra.plano, true);

        Documento.Rateiodocum.SetValues(dbeValorDet.Value, 0, 0, 0,sistema.idempresa, 0, strToIntDef(dblcUnidNegoc.lookupValue, 0), -1,
                                        sistema.idusuario, 0, paramintegra.plano, strToIntDef(CmbPlano.LookupValue, 0),
                                        strToIntDef(CmbPatro.lookupValue, 0), strToIntDef(CmbPrograma.LookupValue, 0),
                                        0, sistema.idEmpresa, dblcTipoRD.LookupValue, 'P',
                                        dblcCentroRespon.LookupValue, CmbCentCusto.LookupValue, '');


        if not Documento.Insert Then
          Raise Exception.Create( 'Erro ao Lançar Documento de Arredondamento: '+ Documento.MessageInfo )
        else //isso aqui é só para marcar o documento como um docum,ento de arredondamento de cpmf
        begin
          Documento.ExecSql('UPDATE DOCUMENTO SET FLGTIPODOCUMENTO = ''2'' WHERE CODDOCUMENTO = ' + floatToStr(Documento.coddocumento) );
          fNumDocLancado := trunc(Documento.coddocumento);
        end;
      except //andré tavares - pendência 24697 - 12/03/2007
        result := false;
        sMsgErro := sMsgErro + Documento.MessageInfo;
        raise exception.create (sMsgErro);
      end;

      Documento.Lanctodocum.SetValues(DtProgBaixaF.date, 0, 0, dbeValorDet.Value, 0, dbeValorDet.Value,
                                       0, iPlnCodigo, 0, sistema.idusuario, sistema.idempresa, 0, 0,
                                       strToInt(dblcTipoDoc.LookupValue), 0, 0, '5', '', '',
                                       '',
                                       EdtHistorico.Text, //andré tavares - pendência 24661 - 12/03/2007
                                       '', '', '',
                                       'D', sistema.idmodulo, paramintegra.plano, true);


      If not Documento.RecbToPagto.Inserir( fNumDocLancado,  //andré tavares - pendência 24620 - 02/03/2007
                                   Documento.Lanctodocum.NumLancto,
                                   sistema.idusuario,
                                   0,
                                   fCodPortForma,
                                   0,
                                   0,
                                   0,
                                   '',
                                   dateToStr(DataFloat),
                                   dateToStr(DtProgBaixaF.date) ) Then
      begin //andré tavares - pendência 24697 - 12/03/2007
        result := false;
        sMsgErro := sMsgErro + Documento.MessageInfo;
        raise exception.create (sMsgErro);
      end;


    end;

  except
    fMessageInfo := sMsgErro;
    result := false;
  end;

end;



procedure TFrmBaixaCPMFMT.FormCreate(Sender: TObject);
begin
  inherited;
  fMessageInfo    := ''; 
  sMsgErro        := ''; //andré tavares - pendência 24697 - 12/03/2007
  Documento       := TCtrlDocumento.Create; {andré tavares - pendência 24417 - 05/02/2007}
  Documento.InitializeAs(Padroes);
  Lancamento      := TCtrlLancamento.Create;
  Lancamento.InitializeAs(Padroes);
  PlacontasCapCar := TCtrlPlacontasCapCar.Create;
  PlacontasCapCar.InitializeAs(Padroes);
end;

procedure TFrmBaixaCPMFMT.FormDestroy(Sender: TObject);
begin
  Documento.free;
  Lancamento.free;
  PlacontasCapCar.free;

  inherited;
end;

procedure TFrmBaixaCPMFMT.SetcodportForma(const Value: Integer);
begin
  FcodportForma := Value;
end;

procedure TFrmBaixaCPMFMT.SetIdfavorecido(const Value: LongInt);
begin
  FIdfavorecido := Value;
end;

procedure TFrmBaixaCPMFMT.SetNumDocLancado(const Value: LongInt);
begin
  FNumDocLancado := Value;
end;

procedure TFrmBaixaCPMFMT.SetmessageInfo(const Value: String);
begin
  FmessageInfo := Value;
end;

end.
