unit uModulo;

interface

uses SysUtils, Dialogs, uCmControlObject, uCmClientDataSet, uCMTypes;

type
  TModulo = class(TCmControlObject)
  private
    // andre tavares - pendencia 19097 - 26/04/2005 FExcluiContab: Boolean;
    FObrigaTrdxImposto: Boolean;
    FExisteParametros: Boolean;
    FValidaCCBaixa: Boolean;
    FControlaEmisCheque: Boolean;
    FObrigaTrdxCCxConta: Boolean;
    FLancaBaixaFloat: Boolean;
    FCorrigeDocAuto: Boolean;
    // andre tavares - pendencia 19097 - 26/04/2005 FExcluiPlanil: Boolean;
    FEstornaFinanc: Boolean;
    FEmiteLancaBaixa: Boolean;
    FObrigaFormaPagto: Boolean;
    FIdReports: Integer;
    FIdTipoCliAdianto: Integer;
    FCodAForne: Integer;
    FSubContaNaoIdent: Integer;
    FIdTipoProcRad: Integer;
    FRamoFornAdianto: Integer;
    FModeloImpressora: Integer;
    FOrigemCm: Integer;
    FCodDocCPMF: Integer;
    FCodDocumento: Integer;
    FFormParam: String;
    FContaNaoIdentificado: String;
    FPpReports: String;
    FFormEventos: String;
    FHistPadFinan: String;
    FImpressoraDefault: string;
    FNomeReport: String;
    FCodTipRecDes: String;
    FModificaAlteradoresDocBaixados: Boolean;
    FBaixaNoCheque: Boolean;
    FSlipAutomatico: Boolean;
    FOPAutomatico: Boolean;
    FRadLote : Double;
    FRADValMinimo : Double;
    FIdContraCheque: integer;

    procedure SetIdReports(const Value: Integer);
    procedure SetNomeReport(const Value: String);

  public
    Constructor Create; Override;

    property IdContraCheque: integer read FIdContraCheque write FIdContraCheque;
    property  IdReports: Integer     read FIdReports      write SetIdReports;
    property  NomeReport: String     read FNomeReport     write SetNomeReport;

    procedure BuscaParamCap(iEmpresa: Integer);
  end;

var
  Modulo: TModulo;

implementation

uses uCtrlParamIntegra, uSistema;

Constructor TModulo.Create;
Begin
  Inherited Create;
  fIdReports            := 0;
  fOrigemCm             := 0;
  fCodDocumento         := 0;
  fNomeReport           := '';
  fFormEventos          := '';
  fFormParam            := '';
  fPpReports            := '';
  fCodTipRecDes         := '';
  fExisteParametros     := False;
  fObrigaTrdxCCxConta   := False;
  fObrigaTrdxImposto    := False;
  fCodDocCPMF           := 0;
  fValidaCCBaixa        := False;
  FBaixaNoCheque        := False;
  FSlipAutomatico       := False;
  FOPAutomatico         := False;
  FRadLote              := 0;
  FRADValMinimo         := 0;
End;

procedure TModulo.BuscaParamCap(iEmpresa: Integer);
Begin
    _Cds.Data := GetDataPacket(
                 ' SELECT P.IMPGENERICA,P.IDTIPOCLIADIANTO, P.CODADFORNE, P.HISTPADFINAN, P.IDRAMOFORNECEDOR, ' +
                 ' P.IDIMPRESSORA, P.FLGESTEXCFINANC, P.FLGEMITELANCBAIX, P.FLGOBRIGFORMAPGTO, P.FLGCOMPLTIPOFAT, P.MASCARANODOCUM, ' +
                 ' P.FLGCORRIGEDOCAUTO, P.FLGCONTROLACHEQUE, P.FLGLANCAFLOAT, R.NAME, ' +
                 ' R.FORMEVENTOS, R.FORMPARAMREL, R.PPREPORT, R.IDREPORTS, R.ORIGEMCM, P.FLGTRDXCCXCONTA, P.FLGTRDXIMPOSTOS, ' +
                 ' P.CODTIPDOCCPMF, P.FLGVALIDACCBAIXA, P.FLGMODADDOCPG, P.FLGSLIPAUTO, P.FLGBAIXACHQ, P.FLGOPAUTO, P.FLGRADLOTE '+
                 ' FROM PARAMCAP P, REPORTS R WHERE IDPESSOA = ' + IntToStr(iEmpresa)
                 + ' AND RECPAG = ''' + ParamIntegra.RecPag + ''' AND P.IDREPORTS = R.IDREPORTS(+) AND P.ORIGEMCM = R.ORIGEMCM(+) ');

    If Not _Cds.IsEmpty Then
    Begin
       If Copy(_Cds.FieldByName('IMPGENERICA').AsString,Length(_Cds.FieldByName('IMPGENERICA').AsString),1) = '\' Then
          FImpressoraDefault := Copy(_Cds.FieldByName('IMPGENERICA').AsString,1,Length(_Cds.FieldByName('IMPGENERICA').AsString)-1)
       Else
          fImpressoraDefault := _Cds.FieldByName('IMPGENERICA').AsString;

       FIdTipocliAdianto    := _Cds.FieldByName('IDTIPOCLIADIANTO').AsInteger;
       FCodAForne           := _Cds.FieldByName('CODADFORNE').AsInteger;
       FHistPadFinan        := _Cds.FieldByName('HISTPADFINAN').AsString;
       FModeloImpressora    := _Cds.FieldByName('IDIMPRESSORA').AsInteger;
       FEstornaFinanc       := (_Cds.FieldByName('FLGESTEXCFINANC').AsString <> 'X');
       FEmiteLancaBaixa     := (_Cds.FieldByName('FLGEMITELANCBAIX').AsString = 'S');
       FObrigaFormaPagto    := (_Cds.FieldByName('FLGOBRIGFORMAPGTO').AsString = 'S');
       FCorrigeDocAuto      := (_Cds.FieldByName('FLGCORRIGEDOCAUTO').AsString = 'S');
       FControlaEmisCheque  := (_Cds.FieldByName('FLGCONTROLACHEQUE').AsString = 'S');
       FRamoFornAdianto     := _Cds.FieldByName('IDRAMOFORNECEDOR').AsInteger;
       FLancaBaixaFloat     := (_Cds.FieldByName('FLGLANCAFLOAT').AsString = 'S');
       fIdReports           := _Cds.FieldByName('IDREPORTS').AsInteger;
       fOrigemCm            := _Cds.FieldByName('ORIGEMCM').AsInteger;
       fNomeReport          := _Cds.FieldByName('NAME').AsString ;
       fFormEventos         := _Cds.FieldByName('FORMEVENTOS').AsString ;
       fFormParam           := _Cds.FieldByName('FORMPARAMREL').AsString ;
       fPpReports           := _Cds.FieldByName('PPREPORT').AsString ;
       fObrigaTrdxCCxConta  := (_Cds.FieldByName('FLGTRDXCCXCONTA').AsString = 'S');
       fObrigaTrdxImposto   := (_Cds.FieldByName('FLGTRDXIMPOSTOS').AsString = 'S');
       fCodDocCPMF          := _Cds.FieldByName('CODTIPDOCCPMF').AsInteger;
       fValidaCCBaixa       := (_Cds.FieldByName('FLGVALIDACCBAIXA').AsString = 'S');
       fModificaAlteradoresDocBaixados := (_Cds.FieldByName('FLGMODADDOCPG').AsString <> 'N');
       FSlipAutomatico      := (_Cds.FieldByName('FLGSLIPAUTO').AsString = 'S');
       FBaixaNoCheque       := (_Cds.FieldByName('FLGBAIXACHQ').AsString = 'S');
       FOPAutomatico        := (_Cds.FieldByName('FLGOPAUTO').AsString = 'S');
       FRadLote             := _Cds.FieldByName('FLGRADLOTE').AsInteger;


       _Cds.Data := GetDataPacket('SELECT CONTALANCNAOIDENT, SUBCONTANAOIDENT FROM PARAMFINANC WHERE IDPESSOA = ' + IntToStr(iEmpresa));
       If Not _Cds.IsEmpty Then
       Begin
          fContaNaoIdentificado := _Cds.FieldByName('CONTALANCNAOIDENT').AsString;
          fSubContaNaoIdent     := _Cds.FieldByName('SUBCONTANAOIDENT').AsInteger;
       End
       Else
       Begin
          fContaNaoIdentificado := '';
          fSubContaNaoIdent     := 0;
       End;

       fExisteParametros     := True;
    End
    Else
    Begin
       FImpressoraDefault    := '';
       FIdTipoCliAdianto     := 0;
       FCodAForne            := 0;
       FHistPadFinan         := '';
       FModeloImpressora     := -1;
       FEstornaFinanc        := True;
       FEmiteLancaBaixa      := False;
       FObrigaFormaPagto     := False;
       FCorrigeDocAuto       := False;
       FControlaEmisCheque   := False;
       FRamoFornAdianto      := -1;
       FLancaBaixaFloat      := False;
       fContaNaoIdentificado := '';
       fSubContaNaoIdent     := 0;
       fExisteParametros     := False;
       fIdReports            := 0;
       fOrigemCm             := 0;
       fNomeReport           := '';
       fFormEventos          := '';
       fFormParam            := '';
       fPpReports            := '';
       fObrigaTrdxCCxConta   := False;
       fObrigaTrdxImposto    := False;
       fCodDocCPMF           := 0;
       fValidaCCBaixa        := False;
       fModificaAlteradoresDocBaixados := True;
       FSlipAutomatico      := false;
       FBaixaNoCheque       := false;
       FOPAutomatico        := false;
       FRadLote             := 0;

    End;

    {*
    If ParamIntegra.RecPag = 'P' Then
       iSistema := 3
    Else
       iSistema := 4;

    _Cds.Data := GetDataPacket('SELECT NOMECOMPO,VALOR FROM PARAMRELATS WHERE (IDMODULO = '
                 + IntToStr(iSistema)  + ') AND (IDPESSOA = ' + IntToStr(iEmpresa) + ')' );

    If Not _Cds.IsEmpty Then
       Begin
         While Not _Cds.Eof Do
         Begin
           Try
            LblRelats := (DtmRelatoriosCapCar.FindComponent(_Cds.FieldByName('NOMECOMPO').AsString) As TppLabel);
            If LblRelats = nil Then
               LblRelats := (DtmRelatoriosCapCar2.FindComponent(_Cds.FieldByName('NOMECOMPO').AsString) As TppLabel);

            If LblRelats <> nil Then
               LblRelats.Caption := _Cds.FieldByName('VALOR').AsString;
           Finally
            _Cds.Next;
           End;
         End;
       End;
    *}

    _Cds.Data := GetDataPacket('SELECT IDTIPOPROCESSO, VALMINIMO FROM RADTIPOPROCESSO WHERE IDREFERENCIA = 6');

     FIdTipoProcRad := 0;
     FRADValMinimo  := 0;
     If (Sistema.UsaRad) And (Not _Cds.IsEmpty) Then Begin
        FIdTipoProcRad := _Cds.FieldByName('IDTIPOPROCESSO').AsInteger;
        FRADValMinimo  := _Cds.FieldByName('VALMINIMO').AsFloat;
     end;
End;

procedure TModulo.SetIdReports(const Value: Integer);
begin
  FIdReports := Value;
end;

procedure TModulo.SetNomeReport(const Value: String);
begin
  FNomeReport := Value;
end;

end.
