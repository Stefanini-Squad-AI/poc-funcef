unit RTipoRentabilidade;

interface
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 20/04/2007
  Pendência    : 25111 descrição do tipo de rentabilidade não está aparecendo completamente.
  Solução      : Os SQLAux e sqlTipoRent o campo virtual '' descrição estava pequeno.
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 26/07/05
  Pendência    : 19893 - O relatório não está aparecendo.
  Solução      : O Componente RptTipoRent perdeu a referência para o método
                 BeforePrint
------------------------------------------------------------------------------}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, Wwdatsrc, uCmSqlParams, DBClient, uCMClientDataSet, ppDB,
  ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands, ppVar, ppPrnabl,
  ppCache, uCtrlContab, uSistema, uCtrlPeriodo, Mask, dBaseDados, TXRB;

type
  TRptTipoRentabilidade = class(TFrmCmReport)
    pplTipoRent: TppBDEPipeline;
    cdsTipoRent: TCMClientDataSet;
    sqlTipoRent: TCMSqlParams;
    dsTipoRent: TwwDataSource;
    sqlSpcConsiste: TCMSqlParams;
    sqlAux: TCMSqlParams;
    cdsSpcConsiste: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    rptTipoRent: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppSystemVariable1: TppSystemVariable;
    ppDetailBand: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppDBText6: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppBDEPipeline1: TppBDEPipeline;
    cdsFundacao: TCMClientDataSet;
    sqlFundacao: TCMSqlParams;
    dsFundacao: TwwDataSource;
    ppLabel16: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel1: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppLabel8: TppLabel;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    procedure rptTipoRentBeforePrint(Sender: TObject);
    procedure ppLabel16Print(Sender: TObject);
  private
    { Private declarations }
    CtrlPeriodo     : TCtrlPeriodo;
    CtrlContab      : TCtrlContab;

    function Mascara( s : string ) : string;

  public
    { Public declarations }
  end;

var
  RptTipoRentabilidade: TRptTipoRentabilidade;

implementation

{$R *.DFM}


function TRptTipoRentabilidade.Mascara(s: string): string;
begin
  Result := FormatMaskText( CtrlContab.MascaraContaParam + ';0; ', s );
  Result := StringReplace( Result, '. ', '', [rfReplaceAll] );
  Result := StringReplace( Result, ' .', '', [rfReplaceAll] );
  Result := StringReplace( Result, ' ', '', [rfReplaceAll] );
end;

procedure TRptTipoRentabilidade.rptTipoRentBeforePrint(Sender: TObject);
Var
  iCont, iContEdi : Integer;

begin
  inherited;
  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize( dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,False );

  CtrlContab := TCtrlContab.Create;
  CtrlContab.InitializeAs( CtrlPeriodo );

  if not CtrlContab.SelecionaParametros( Sistema.IdEmpresa ) Then
    ShowMessage( CtrlContab.MessageInfo );

  If cdsFundacao.Active Then
    cdsFundacao.Close;

  sqlFundacao.Prepare;
  sqlFundacao.Open;

  sqlSpcConsiste.Sql.Clear;
  If CmpRptCM.ParamByName('iTipoRent').AsString = '' Then
    sqlSpcConsiste.Sql.Add(' SELECT DISTINCT S.IDSPCCONSISTE, S.DESCRICAO, '+
                           '        I.DTSPCCONSISTE ' +
                           ' FROM SPCCONSISTE S, '+
                           '      ITEMSPCCONSISTE I '+
                           ' WHERE S.TIPOCONSISTE = ''TR'' '+
                           '   AND I.IDSPCCONSISTE = S.IDSPCCONSISTE')
  Else
  begin
    if CmpRptCM.ParamByName('dDataComp').AsString = '' then
      sqlSpcConsiste.Sql.Add(' SELECT DISTINCT S.IDSPCCONSISTE, S.DESCRICAO, '+
                             '        I.DTSPCCONSISTE ' +
                             ' FROM SPCCONSISTE S, '+
                             '      ITEMSPCCONSISTE I ' +
                             ' WHERE S.IDSPCCONSISTE = '+CmpRptCM.ParamByName('iTipoRent').AsString+
                             '   AND I.IDSPCCONSISTE = S.IDSPCCONSISTE' +
                             ' ORDER BY '+
                             '   IDSPCCONSISTE, '+
                             '   DESCRICAO ')
    else
      sqlSpcConsiste.Sql.Add(' SELECT DISTINCT S.IDSPCCONSISTE, S.DESCRICAO, '+
                             '        I.DTSPCCONSISTE ' +
                             ' FROM SPCCONSISTE S, '+
                             '      ITEMSPCCONSISTE I ' +
                             ' WHERE S.IDSPCCONSISTE = '+CmpRptCM.ParamByName('iTipoRent').AsString+
                             '   AND I.IDSPCCONSISTE = S.IDSPCCONSISTE' +
                             '   AND (I.DTSPCCONSISTE = ' + QuotedStr(CmpRptCM.ParamByName('dDataComp').AsString) + ')' +
                             ' ORDER BY '+
                             '   IDSPCCONSISTE, '+
                             '   DESCRICAO ');
  end;

  sqlTipoRent.Open;
  sqlSpcConsiste.Open;
  while not cdsSpcConsiste.Eof do
  begin
    iCont    := 0;
    iContEdi := 0;

    sqlAux.Sql.Clear;
    sqlAux.Sql.Add(' SELECT '+QuotedStr(cdsSpcConsiste.FieldByName('DESCRICAO').AsString)+' AS DESCRICAO, '+
                   '   P.PLACONTA '+

                   ' FROM '+
                   '   ITEMSPCCONSISTE I, '+
                   '   PLANOCONTA P '+

                   ' WHERE I.IDSPCCONSISTE = '+ cdsSpcConsiste.FieldByName('IDSPCCONSISTE').AsString +
                   '   AND I.DTSPCCONSISTE = '+ QuotedStr(cdsSpcConsiste.FieldByName('DTSPCCONSISTE').AsString) +
                   '   AND I.PLANO         = P.PLANO '+
                   '   AND I.PLACONTA      = P.PLACONTA '+
                   '   AND P.PLAGRUPO      = ''A'' ');
    sqlAux.Open;

    cdsTipoRent.Locate('IDSPCCONSISTE', cdsSpcConsiste.FieldByName('IDSPCCONSISTE').AsInteger, []);
    while not cdsAux.Eof do
    begin
      cdsTipoRent.Append;
      cdsTipoRent.FieldByName('IDSPCCONSISTE').AsInteger := cdsSpcConsiste.FieldByName('IDSPCCONSISTE').AsInteger;
      cdsTipoRent.FieldByName('DESCRICAO').AsString      := CdsAux.FieldByName('DESCRICAO').AsString;
      cdsTipoRent.FieldByName('DTSPCCONSISTE').AsDateTime := cdsSpcConsiste.FieldByName('DTSPCCONSISTE').AsDateTime;
      cdsTipoRent.FieldByName('ATIVO').AsString          := Mascara( CdsAux.FieldByName('PLACONTA').AsString );
      cdsTipoRent.Post;
      cdsAux.Next;
      Inc(iCont);
    end;

    sqlAux.Sql.Clear;
    sqlAux.Sql.Add(' SELECT '+QuotedStr(cdsSpcConsiste.FieldByName('DESCRICAO').AsString)+' AS DESCRICAO, '+
                   '   P.PLACONTA '+

                   ' FROM '+
                   '   ITEMSPCCONSISTE I, '+
                   '   PLANOCONTA P '+

                   ' WHERE I.IDSPCCONSISTE = '+ cdsSpcConsiste.FieldByName('IDSPCCONSISTE').AsString +
                   '   AND I.DTSPCCONSISTE = '+ QuotedStr(cdsSpcConsiste.FieldByName('DTSPCCONSISTE').AsString) +
                   '   AND I.PLANO         = P.PLANO '+
                   '   AND I.PLACONTA      = P.PLACONTA '+
                   '   AND P.PLAGRUPO      = ''P'' ');
    sqlAux.Open;

    cdsTipoRent.Locate('IDSPCCONSISTE', cdsSpcConsiste.FieldByName('IDSPCCONSISTE').AsInteger, []);
    while not cdsAux.Eof do
    begin
      If iContEdi < iCont Then
      Begin
        cdsTipoRent.Edit;
        cdsTipoRent.FieldByName('PASSIVO').AsString := Mascara( CdsAux.FieldByName('PLACONTA').AsString );
        cdsTipoRent.Post;
        cdsTipoRent.Next;
      End
      Else
      Begin
        cdsTipoRent.Append;
        cdsTipoRent.FieldByName('IDSPCCONSISTE').AsInteger := cdsSpcConsiste.FieldByName('IDSPCCONSISTE').AsInteger;
        cdsTipoRent.FieldByName('DESCRICAO').AsString      := CdsAux.FieldByName('DESCRICAO').AsString;
        cdsTipoRent.FieldByName('DTSPCCONSISTE').AsDateTime := cdsSpcConsiste.FieldByName('DTSPCCONSISTE').AsDateTime;
        cdsTipoRent.FieldByName('PASSIVO').AsString        := Mascara( CdsAux.FieldByName('PLACONTA').AsString );
        cdsTipoRent.Post;
      End;
      cdsAux.Next;
      Inc(iContEdi);
    end;
    If iCont < iContEdi Then
      iCont := iContEdi;

    iContEdi := 0;


    sqlAux.Sql.Clear;
    sqlAux.Sql.Add(' SELECT '+QuotedStr(cdsSpcConsiste.FieldByName('DESCRICAO').AsString)+' AS DESCRICAO, '+
                   '   P.PLACONTA '+

                   ' FROM '+
                   '   ITEMSPCCONSISTE I, '+
                   '   PLANOCONTA P '+

                   ' WHERE I.IDSPCCONSISTE = '+ cdsSpcConsiste.FieldByName('IDSPCCONSISTE').AsString +
                   '   AND I.DTSPCCONSISTE = '+ QuotedStr(cdsSpcConsiste.FieldByName('DTSPCCONSISTE').AsString) +
                   '   AND I.PLANO         = P.PLANO '+
                   '   AND I.PLACONTA      = P.PLACONTA '+
                   '   AND P.PLAGRUPO      = ''R'' ');
    sqlAux.Open;

    cdsTipoRent.Locate('IDSPCCONSISTE', cdsSpcConsiste.FieldByName('IDSPCCONSISTE').AsInteger, []);
    while not cdsAux.Eof do
    begin
      If iContEdi < iCont Then
      Begin
        cdsTipoRent.Edit;
        cdsTipoRent.FieldByName('RECEITA').AsString := Mascara( CdsAux.FieldByName('PLACONTA').AsString );
        cdsTipoRent.Post;
        cdsTipoRent.Next;
      End
      Else
      Begin
        cdsTipoRent.Append;
        cdsTipoRent.FieldByName('IDSPCCONSISTE').AsInteger := cdsSpcConsiste.FieldByName('IDSPCCONSISTE').AsInteger;
        cdsTipoRent.FieldByName('DESCRICAO').AsString      := CdsAux.FieldByName('DESCRICAO').AsString;
        cdsTipoRent.FieldByName('DTSPCCONSISTE').AsDateTime := cdsSpcConsiste.FieldByName('DTSPCCONSISTE').AsDateTime;
        cdsTipoRent.FieldByName('RECEITA').AsString        := Mascara( CdsAux.FieldByName('PLACONTA').AsString );
        cdsTipoRent.Post;
      End;
      cdsAux.Next;
      Inc(iContEdi);
    end;
    If iCont < iContEdi Then
      iCont := iContEdi;

    iContEdi := 0;

    sqlAux.Sql.Clear;
    sqlAux.Sql.Add(' SELECT '+QuotedStr(cdsSpcConsiste.FieldByName('DESCRICAO').AsString)+' AS DESCRICAO, '+
                   '   P.PLACONTA '+

                   ' FROM '+
                   '   ITEMSPCCONSISTE I, '+
                   '   PLANOCONTA P '+

                   ' WHERE I.IDSPCCONSISTE = '+ cdsSpcConsiste.FieldByName('IDSPCCONSISTE').AsString +
                   '   AND I.DTSPCCONSISTE = '+ QuotedStr(cdsSpcConsiste.FieldByName('DTSPCCONSISTE').AsString) +
                   '   AND I.PLANO         = P.PLANO '+
                   '   AND I.PLACONTA      = P.PLACONTA '+
                   '   AND P.PLAGRUPO      = ''D'' ');
    sqlAux.Open;

    cdsTipoRent.Locate('IDSPCCONSISTE', cdsSpcConsiste.FieldByName('IDSPCCONSISTE').AsInteger, []);
    while not cdsAux.Eof do
    begin
      If iContEdi < iCont Then
      Begin
        cdsTipoRent.Edit;
        cdsTipoRent.FieldByName('DESPESA').AsString := Mascara( CdsAux.FieldByName('PLACONTA').AsString );
        cdsTipoRent.Post;
        cdsTipoRent.Next;
      End
      Else
      Begin
        cdsTipoRent.Append;
        cdsTipoRent.FieldByName('IDSPCCONSISTE').AsInteger := cdsSpcConsiste.FieldByName('IDSPCCONSISTE').AsInteger;
        cdsTipoRent.FieldByName('DESCRICAO').AsString      := CdsAux.FieldByName('DESCRICAO').AsString;
        cdsTipoRent.FieldByName('DTSPCCONSISTE').AsDateTime := cdsSpcConsiste.FieldByName('DTSPCCONSISTE').AsDateTime;
        cdsTipoRent.FieldByName('DESPESA').AsString        := Mascara( CdsAux.FieldByName('PLACONTA').AsString );
        cdsTipoRent.Post;
      End;
      cdsAux.Next;
      Inc(iContEdi);
    end;
    cdsSpcConsiste.Next;
  end;

  CtrlPeriodo.free;
  CtrlContab.free;
end;

procedure TRptTipoRentabilidade.ppLabel16Print(Sender: TObject);
begin
  inherited;
  ppLabel16.Text := Sistema.NomeEmpresa;
end;

end.
