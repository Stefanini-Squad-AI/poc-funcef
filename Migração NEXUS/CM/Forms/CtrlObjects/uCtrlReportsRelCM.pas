{-------------------------------------------------------------------------------------------------
Rotina......: FazerSelectsGeraisReport
Nº SOL......: 244125.18329
Data........: 06/10/2016
Responsável.: Marcelo Cardoso
Descrição...: Melhoria no Cad. de Relatórios, para que seja validado na primeira consulta, se existe
              dados para o parametro informado. Deve ser apresentado uma menssagem
-------------------------------------------------------------------------------------------------
Desenvolvedor: Wylliam Leite da Silva
Data.........: 12/02/2015
SOL / PPM....: 248183 / 667246
Alteração....: Rotina de geração de relatório Boletos - Acompanhamento, foi
               alterado o tipo string para String Lista para comportar o select
               inteiro sem ser truncado
--------------------------------------------------------------------------------
 Rotina......: Grid
Nº SOL......: 231267/16158
Nº KINTANA..: 412192
Data........: 10/10/2014
Responsável.: Higor Nayde
Descrição...: Criação de relacionamento entre consultas
--------------------------------------------------------------------------------
  Desenvolvedor: Vinicius Eduardo Nascimento Maciel
  Data.........: 14/02/2012
  SOL / Kintana: 168857 / 1506883
  Alteração....: rotina ListaReports, inclusão do campo FLGRELATATIVO
--------------------------------------------------------------------------------
  Desenvolvedor: Arnaldo Vicente Scarin
  Data.........: 29/04/2010
  SOL / Kintana: 132513 / 765092
  Alteração....: Implementação de SubRelatorio nos Relatórios definidos pelo sistema
--------------------------------------------------------------------------------}
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 07/06/2002                             }
{                                                       }
{*******************************************************}

// andre tavares - pendência 17165 - 02/03/2005


unit uCtrlReportsRelCM;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uSistema, uDbReportsRelCM, Dialogs, Classes;

Type
  TCtrlReportsRelCM = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbReports: TDbReportsRelCm;
    Fcds: TClientDataSet;
    FcdsSub1: TClientDataSet;
    FcdsSub3: TClientDataSet;
    FcdsSub2: TClientDataSet;
    FcdsSub4: TClientDataSet;
    //SOL244125.18329- Marcelo Cardoso - INICIO
    FcdsSub5: TClientDataSet;
    FcdsSub6: TClientDataSet;
    //SOL244125.18329- Marcelo Cardoso - FIM

    procedure Setcds(const Value: TClientDataSet);
    // Inicio - Arnaldo V. Scarin - Sol 132513
    procedure SetcdsSub1(const Value: TClientDataSet);
    procedure SetcdsSub2(const Value: TClientDataSet);
    procedure SetcdsSub3(const Value: TClientDataSet);
    procedure SetcdsSub4(const Value: TClientDataSet);
    //SOL244125.18329- Marcelo Cardoso - INICIO
    procedure SetcdsSub5(const value: TclientDataSet);
    procedure SetcdsSub6(const value: TclientDataSet);
    //SOL244125.18329- Marcelo Cardoso - FIM

    // Final - Arnaldo V. Scarin - Sol 132513
  Public
    Property cds:     TClientDataSet read Fcds     write Setcds;
    // Inicio - Arnaldo V. Scarin - Sol 132513
    Property cdsSub1: TClientDataSet read FcdsSub1 write SetcdsSub1;
    Property cdsSub2: TClientDataSet read FcdsSub2 write SetcdsSub2;
    Property cdsSub3: TClientDataSet read FcdsSub3 write SetcdsSub3;
    Property cdsSub4: TClientDataSet read FcdsSub4 write SetcdsSub4;
    //SOL244125.18329- Marcelo Cardoso - INICIO
    property cdsSub5: TclientDataSet read FcdsSub5 write SetcdsSub5;
    property cdsSub6: TclientDataSet read FcdsSub6 write SetcdsSub6;
    //SOL244125.18329- Marcelo Cardoso - FIM

    // Final - Arnaldo V. Scarin - Sol 132513
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    Procedure Procurar( IdReports: Double = 0; OrigemCm: Double = -1 );
    Function  ListaReports( IdReports: Double = 0; OrigemCm: Double = -1; scondicao: String = '' ): OleVariant;
    Function  Gravar: Boolean;
    procedure substituiValorParam(var sSql: TStringList);


    function CarregaNomeConsulta(IReport : Double;sOrigem:String): OleVariant;
    function CarregaNomeCompo(Name : String;tipo :integer;Origem :String): OleVariant;
    function CarregaGridConsulta(IReport : Double): OleVariant;
//    function CarregaGridFiltro(IReport: Double) : OleVariant;   //SOL244125.18329- Marcelo Cardoso
    function CarregOrigemNome(nome : String): OleVariant;
  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlReportsRelCM.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarReports( Fcds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcds, _DbReports, [], [] );
        Msg    := _DbReports.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Commit;
     Except
        On E:Exception Do
        Begin
           Rollback;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

constructor TCtrlReportsRelCM.Create;
begin
  inherited;
  _DbReports := TDbReportsRelCm.Create( Self );
  FCds     := TClientDataSet.Create( nil );
  // Inicio - Arnaldo V. Scarin - Sol 132513
  FCdsSub1 := TClientDataSet.Create( nil );
  FCdsSub2 := TClientDataSet.Create( nil );
  FCdsSub3 := TClientDataSet.Create( nil );
  FCdsSub4 := TClientDataSet.Create( nil );
  //SOL244125.18329- Marcelo Cardoso - INICIO
  FCdsSub5 := TClientDataSet.Create( nil );
  FCdsSub6 := TClientDataSet.Create( nil );
  //SOL244125.18329- Marcelo Cardoso - FIM

  // Final - Arnaldo V. Scarin - Sol 132513
end;

destructor TCtrlReportsRelCM.Destroy;
begin
  // Inicio - Arnaldo V. Scarin - Sol 132513
  If Fcds.Active Then
     Fcds.Close;
  If FcdsSub1.Active Then
     FcdsSub1.Close;
  If FcdsSub2.Active Then
     FcdsSub2.Close;
  If FcdsSub3.Active Then
     FcdsSub3.Close;
  If FcdsSub4.Active Then
     FcdsSub4.Close;
  //SOL244125.18329- Marcelo Cardoso - INICIO
  if FcdsSub5.Active then
     FcdsSub5.Close;
  if FcdsSub6.Active then
     FcdsSub6.Close;

  FreeAndNil(FcdsSub6);
  FreeAndNil(FcdsSub5);
  //SOL244125.18329- Marcelo Cardoso - FIM

  FreeAndNil(FCdsSub4);
  FreeAndNil(FCdsSub3);
  FreeAndNil(FCdsSub2);
  FreeAndNil(FCdsSub1);
  // Final - Arnaldo V. Scarin - Sol 132513
  FreeAndNil(Fcds);
  _DbReports.Free;
  inherited;
end;

procedure TCtrlReportsRelCM.DoChangeDataBase;
begin
  inherited;
  _DbReports.DataBaseName := DatabaseName;
end;

function TCtrlReportsRelCM.ListaReports( IdReports: Double = 0; OrigemCm: Double = -1; scondicao: String = '' ): OleVariant;
var
  sql: String;
begin
   Sql := 'SELECT R.IDREPORTS,' + #13#10 +
         '       R.ORIGEMCM,' + #13#10 +
         '       R.IDMODULO,' + #13#10 +
         '       R.IDGRUPORELATORIO,' + #13#10 +
         '       R.ORIGEMCMGR,' + #13#10 +
         '       R.IDDATAVIEW,' + #13#10 +
         '       R.ORIGEMCMDV,' + #13#10 +
         '       R.NAME,' + #13#10 +
         '       R.DESCRIPTION,' + #13#10 +
         '       R.TEMPLATE,' + #13#10 +
         '       R.PPREPORT,' + #13#10 +
         '       R.FORMPARAMREL,' + #13#10 +
         '       R.FORMEVENTOS,' + #13#10 +
         '       R.FLGFILTROMANUAL,' + #13#10 +
         '       R.FLGTIPO,' + #13#10 +
         '       R.FLGEXIBENOPREVIEW,' + #13#10 +
         '       R.FLGAUDITORIAFRONT,' + #13#10 +
         '       D.NAME AS NOMEDATAVIEW,' + #13#10 +
         '       G.DESCRICAO,' + #13#10 +
         '       M.NOMEMODULO,' + #13#10 +
         '       R.FLGSUBREPORT,' + #13#10 +
         '       R.IDSUBDATAVIEW1,' + #13#10 +
         '       R.ORIGEMCMDV1,' + #13#10 +
         '       D1.NAME AS NOMESUBDATAVIEW1,' + #13#10 +
         '       R.IDSUBDATAVIEW2,' + #13#10 +
         '       R.ORIGEMCMDV2,' + #13#10 +
         '       D2.NAME AS NOMESUBDATAVIEW2,' + #13#10 +
         '       R.IDSUBDATAVIEW3,' + #13#10 +
         '       R.ORIGEMCMDV3,' + #13#10 +
         '       D3.NAME AS NOMESUBDATAVIEW3,' + #13#10 +
         '       R.IDSUBDATAVIEW4,' + #13#10 +
         '       R.ORIGEMCMDV4,' + #13#10 +
         '       R.FLGEXPORTADADOS,' + #13#10 +
         '       R.FLGRELATATIVO, ' + #13#10 + //Vinicius Maciel - SOL 168857 - KINTANA 1506883
         '       D4.NAME AS NOMESUBDATAVIEW4,' + #13#10 +
         '       R.IDSUBDATAVIEW5,' + #13#10 + // Marcelo Cardoso - SOL244125.18329 - INICIO
         '       R.ORIGEMCMDV5,' + #13#10 +
         '       D5.NAME AS NOMESUBDATAVIEW5,' + #13#10 +
         '       R.IDSUBDATAVIEW6,' + #13#10 +
         '       R.ORIGEMCMDV6,' + #13#10 +
         '       D6.NAME AS NOMESUBDATAVIEW6' + #13#10 + // Marcelo Cardoso - SOL244125.18329 - FIM
         '  FROM REPORTS R, DATAVIEW D, GRUPORELATORIO G, MODULO M,' + #13#10 +
         '       DATAVIEW D1, DATAVIEW D2, DATAVIEW D3, DATAVIEW D4,' + #13#10 +
         '       DATAVIEW D5, DATAVIEW D6' + #13#10 + //SOL244125.18329- Marcelo Cardoso 
         ' WHERE R.IDDATAVIEW = D.IDDATAVIEW(+)' + #13#10 +
         '   AND R.ORIGEMCMDV = D.ORIGEMCMDV(+)' + #13#10 +
         '   AND R.IDSUBDATAVIEW1 = D1.IDDATAVIEW(+)' + #13#10 +
         '   AND R.ORIGEMCMDV1 = D1.ORIGEMCMDV(+)' + #13#10 +
         '   AND R.IDSUBDATAVIEW2 = D2.IDDATAVIEW(+)' + #13#10 +
         '   AND R.ORIGEMCMDV2 = D2.ORIGEMCMDV(+)' + #13#10 +
         '   AND R.IDSUBDATAVIEW3 = D3.IDDATAVIEW(+)' + #13#10 +
         '   AND R.ORIGEMCMDV3 = D3.ORIGEMCMDV(+)' + #13#10 +
         '   AND R.IDSUBDATAVIEW4 = D4.IDDATAVIEW(+)' + #13#10 +
         '   AND R.ORIGEMCMDV4 = D4.ORIGEMCMDV(+)' + #13#10 +
		 //SOL244125.18329- Marcelo Cardoso - INICIO
         '   AND R.IDSUBDATAVIEW5 = D5.IDDATAVIEW(+)' + #13#10 +
         '   AND R.ORIGEMCMDV5 = D5.ORIGEMCMDV(+)' + #13#10 +
         '   AND R.IDSUBDATAVIEW6 = D6.IDDATAVIEW(+)' + #13#10 +
         '   AND R.ORIGEMCMDV6 = D6.ORIGEMCMDV(+)' + #13#10 +
		 //SOL244125.18329- Marcelo Cardoso - FIM
         '   AND R.IDGRUPORELATORIO = G.IDGRUPORELATORIO(+)' + #13#10 +
         '   AND R.ORIGEMCMGR = G.ORIGEMCMGR(+)' + #13#10 +
         '   AND R.IDMODULO = M.IDMODULO(+)';

  If idReports <> 0 Then
     Sql := Sql +#13#10+'   AND IDREPORTS = ' + FloatToStr( IdReports ) + ' ';

  If OrigemCm > -1 Then
     Sql := Sql +#13#10+'   AND ORIGEMCM = ' + FloatToStr( OrigemCm ) + ' ';

  If sCondicao <> '' Then
     Sql := Sql + #13#10 + Trim( scondicao ) + ' ';

  Sql := Sql + #13#10 + 'ORDER BY NAME';
  Result := GetDataPacket( Sql );
end;

procedure TCtrlReportsRelCM.Procurar( IdReports: Double = 0; OrigemCm: Double = -1 );
begin
  If ConnectionSide = cnsClient Then Begin
     Connection.AppServer.ProcurarReports( IdReports, OrigemCm );
  End Else Begin
     _dbReports.IdReports.AsFloat := IdReports;
     _dbReports.OrigemCm.AsFloat  := OrigemCm;
  End;
end;

procedure TCtrlReportsRelCM.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlReportsRelCM.substituiValorParam(var sSql: TStringList);
var// ---------------------Início--------------------------
   // Wylliam Silva - 12/02/2015 - PPM: 667246 SOL: 248183
   // Foi trocado o tipo string para Sitring List pois o
   // resultado o select traz um campo Long Raw e a string
   // trunca esse valor- Wylliam Silva - 12/02/2015

   {sSQLOrig: string;}
   sSQLOrig: TStringList;
   //------------------------Fim--------------------------

   i,iMaxCharQry : integer;
   bEncontrouParam: Boolean;
   iPosicaoIni, iPosicaoFim: Integer;
   sParamNull: String;
begin
  // --------------------------------Início-------------------------------------
  // Vamos começar a utilizar uma string list para poder suportar o campo long raw
  // Wylliam Silva - 12/02/2015 - PPM: 667246 SOL: 248183
  // Passa a qry original à variável
  {sSQLOrig:= sSql;}

  sSQLOrig := TStringList.Create;
  sSQLOrig.Assign(sSql);
  //---------Fim---------

  i := 1;

  {iMaxCharQry := length(sSQLOrig);} // Wylliam Silva - 12/02/2015 - PPM: 667246 SOL: 248183

  bEncontrouParam := false;

  // --------------------------------Início-------------------------------------
  // Trocamos o :='' por Clear para a String List
  // - Wylliam Silva - 12/02/2015 - PPM: 667246 SOL: 248183.

  // Limpa a variável, pois ela será remontada com
  //a qry de parâmetros zerados
  //sSql := '';
  sSql.Clear;
  //---------Fim - Wylliam Silva - 12/02/2015 - PPM: 667246 SOL: 248183---------


  // Varre a qry em busca de parâmetros e substitui-os com "null"
  for i := 0 to sSQLOrig.Count -1{iMaxCharQry} do //Pegamos a quantidade de linhas da String List agora - Wylliam Silva - 12/02/2015 - PPM: 667246 SOL: 248183
  begin
     if (Pos('#', sSQLOrig[i]) > 0) then
     begin
          iPosicaoIni:= Pos('#', sSQLOrig[i]);
          iPosicaoFim:= Pos('#',(Copy(sSQLOrig[i], iPosicaoIni + 1, Length(sSQLOrig[i]))));
          sParamNull:= StringReplace(sSQLOrig[i], Copy(sSQLOrig[i],iPosicaoIni -1,iPosicaoFim+3), 'null', [rfReplaceAll]);
          sSQLOrig[i]:= (sParamNull);
     end;

     sSql.Add(sSQLOrig[i]);
  end;
end;

// Inicio - Arnaldo V. Scarin - Sol 132513
procedure TCtrlReportsRelCM.SetcdsSub1(const Value: TClientDataSet);
begin
  FcdsSub1 := Value;
end;

procedure TCtrlReportsRelCM.SetcdsSub2(const Value: TClientDataSet);
begin
  FcdsSub2 := Value;
end;

procedure TCtrlReportsRelCM.SetcdsSub3(const Value: TClientDataSet);
begin
  FcdsSub3 := Value;
end;

procedure TCtrlReportsRelCM.SetcdsSub4(const Value: TClientDataSet);
begin
  FcdsSub4 := Value;
end;

//SOL244125.18329- Marcelo Cardoso - INICIO
procedure TCtrlReportsRelCM.SetcdsSub5(const Value: TClientDataSet);
begin
  FcdsSub5 := Value;
end;


procedure TCtrlReportsRelCM.SetcdsSub6(const Value: TClientDataSet);
begin
  FcdsSub6 := Value;
end;
//SOL244125.18329- Marcelo Cardoso - INICIO

function TCtrlReportsRelCM.CarregaNomeConsulta(IReport: Double;sOrigem:String): OleVariant;
var Sql, IdDataView: string;
cdsAux: TClientDataSet;
begin
  cdsAux     := TClientDataSet.Create( nil );
 Sql := 'SELECT D.IDDATAVIEW,   '+
        ' NVL(R.IDSUBDATAVIEW1,null) IDSUBDATAVIEW1, '+
        ' NVL(R.IDSUBDATAVIEW2,null) IDSUBDATAVIEW2,       '+
        ' NVL(R.IDSUBDATAVIEW3,null) IDSUBDATAVIEW3,       '+
        ' NVL(R.IDSUBDATAVIEW4,null) IDSUBDATAVIEW4,       '+
		//SOL244125.18329- Marcelo Cardoso - INCIO
        ' NVL(R.IDSUBDATAVIEW5,null) IDSUBDATAVIEW5,       '+
        ' NVL(R.IDSUBDATAVIEW6,null) IDSUBDATAVIEW6        '+
		//SOL244125.18329- Marcelo Cardoso - FIM
      ' FROM DATAVIEW D, REPORTS R '+
      ' WHERE R.IDREPORTS = ' +   FloatToStr(IReport)+
      '  AND R.IDDATAVIEW = D.IDDATAVIEW(+) '+
      '  AND D.ORIGEMCMDV = '+ sOrigem+
      '  AND R.IDDATAVIEW IS NOT NULL      ';

   cdsAux.Data := GetDataPacket( Sql );

  //IdDataView  :=  cdsAux.FieldByName('IDDATAVIEW').AsString;
  if (cdsAux.FieldByName('IDSUBDATAVIEW1').AsString <> '') then
    IdDataView  :=  cdsAux.FieldByName('IDSUBDATAVIEW1').AsString;
  if (cdsAux.FieldByName('IDSUBDATAVIEW2').AsString <> '') then
     IdDataView  :=IdDataView+','+ cdsAux.FieldByName('IDSUBDATAVIEW2').AsString;
  if (cdsAux.FieldByName('IDSUBDATAVIEW3').AsString <> '')then
     IdDataView  :=IdDataView+','+ cdsAux.FieldByName('IDSUBDATAVIEW3').AsString;
  if (cdsAux.FieldByName('IDSUBDATAVIEW4').AsString <> '')then
      IdDataView  :=IdDataView+','+ cdsAux.FieldByName('IDSUBDATAVIEW4').AsString;
  //SOL244125.18329- Marcelo Cardoso - INICIO
  if (cdsAux.FieldByName('IDSUBDATAVIEW5').AsString <> '')then
      IdDataView  :=IdDataView+','+ cdsAux.FieldByName('IDSUBDATAVIEW5').AsString;
  if (cdsAux.FieldByName('IDSUBDATAVIEW6').AsString <> '')then
      IdDataView  :=IdDataView+','+ cdsAux.FieldByName('IDSUBDATAVIEW6').AsString;
//SOL244125.18329- Marcelo Cardoso - FIM

    if IdDataView = '' then begin

     Sql :=' SELECT *             '+
           '  FROM DATAVIEW DT    '+
           ' WHERE DT.IDDATAVIEW IN ('+cdsAux.FieldByName('IDDATAVIEW').AsString+' )'+
           ' AND DT.ORIGEMCMDV = '+ sOrigem;
     end
     else
    begin
     Sql :=' SELECT *                       '+
           '   FROM DATAVIEW DT               '+
           ' WHERE DT.IDDATAVIEW IN ('+cdsAux.FieldByName('IDDATAVIEW').AsString+')'+
           '   AND DT.ORIGEMCMDV = '+ sOrigem +
           '  union all                      '+
           '   SELECT *                      '+
           ' FROM DATAVIEW DT               '+
           '   WHERE DT.IDDATAVIEW IN ('+IdDataView+')  ';

    end;
  Result := GetDataPacket( Sql );
end;

function TCtrlReportsRelCM.CarregaNomeCompo(Name: String;tipo :integer;Origem :String): OleVariant;
var Sql: string;
begin
  if tipo = 1 then
    Sql := 'SELECT TEMPLATE FROM DATAVIEW where NAME = '+QuotedStr(Name) +' and ORIGEMCMDV = '+Origem
  else if tipo = 3 then
    Sql := 'SELECT NAME,ORIGEMCMDV  FROM DATAVIEW where IDDATAVIEW = '+Name +' and ORIGEMCMDV = '+Origem
  else
      Sql := name;

 {Sql := 'SELECT * FROM DATAVIEW D, REPORTS R '+
          ' WHERE R.IDREPORTS = ' +   FloatToStr(IReport)+
          ' AND R.IDDATAVIEW = D.IDDATAVIEW(+) ';}

  Result := GetDataPacket( Sql );
end;

function TCtrlReportsRelCM.CarregaGridConsulta(
  IReport: Double): OleVariant;
var Sql: string;
  begin
  Sql := 'SELECT RP.*,DT.NAME, DW.NAME AS NAMEFILTRO  FROM CM.REPORTSLISTADATAVIEW RP, DATAVIEW DT,DATAVIEW DW WHERE RP.IDREPORTS = ' +   FloatToStr(IReport)+
         ' AND DT.IDDATAVIEW = RP.IDDATAVIEWORIGEM '+
         ' AND DT.ORIGEMCMDV = RP.ORIGEMCMDV '+
         ' AND DW.IDDATAVIEW = RP.IDDATAVIEWCONSULTA'+
         ' ORDER BY RP.IDDATAVIEWORIGEM, RP.NOMECAMPO';


  Result := GetDataPacket( Sql );
end;

function TCtrlReportsRelCM.CarregOrigemNome(nome: String): OleVariant;
var Sql: string;
begin
  Sql := 'SELECT ORIGEMCMDV FROM DATAVIEW WHERE NAME LIKE ' +QuotedStr(Nome);
  Result := GetDataPacket( Sql );
end;

end.

