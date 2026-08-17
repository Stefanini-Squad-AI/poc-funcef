unit uCtrlDesenhoDemo;
{-------------------------------------------------------------------------------
   Data      : 22/11/2005
   Autor     : Rodolpho da Silva
   Pendência : 20809
   Descrição : Ao marcar a opção "Desconsiderar o Encerramento das Contas de
               Resultado" o sistema não está trazendo os lançamentos das contas
               contábeis do exercício anterior.
-------------------------------------------------------------------------------}

interface

Uses DB, uDataBase, uDbDesenhoDemo, uCmControlObject, dbclient, sysutils,
     Provider, ComCtrls,CMProcuraMask, CMProcura,DBTables,uDbReports,
     uCMTypes;


  Type

    TCtrlDesenhoDemo = Class(TCmControlObject)

    private
      //-------------------------------------------------------------------------
      // Classes de Persistência
      //-------------------------------------------------------------------------
      FdbDesenhoDemo  : TDbDesenhoDemo;
      FdbReports      : TDbReports;


      //-------------------------------------------------------------------------
      // Componentes de uso interno
      //-------------------------------------------------------------------------
      FCdsDEsenhoDemo : TClientDataSet;
      FCdsReports     : TClientDataSet;

      procedure SetCdsDesenhoDemo(const Value: TClientDataSet);
      procedure SetCdsReports(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;


    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsDesenhoDemo: TClientDataSet Read FCdsDesenhoDemo Write SetCdsDEsenhoDemo;
      property CdsReports: TClientDataSet Read FCdsReports Write SetCdsReports;

      {Esta função tem como objetivo listar os subgrupos}
      Function ListDesenhoDemo(dIdDesenho:Double) :OleVariant;

      {Esta função tem o objetivo de gravar os subgrupos}
      Function Gravar :Boolean;

      {Esta função tem o objetivo de apagar os layouts}
      Function Apagar :Boolean;

      {Esta função tem o objetivo de retornar regsitros da tabela report}
      Function ListReports(dIdReports,dOrigemCM :Double) :OleVariant;

      {Esta função tem o objetivo de preencher o cdsDemoNormal}
      Function ListCdsDemoNormal :OleVariant;

      {Esta função tem o objetivo de preencher o cdsDemoColMes}
      Function ListCdsDemoColMes :OleVariant;

      {Esta função tem o objetivo de preencher o cdsDemoBalPatr}
      Function ListCdsDemoBalPatr :OleVariant;

      {Esta função tem o objetivo de preencher o cdsDemoBalPatr}
      Function ListCdsDemoColunado :OleVariant;

    End;


implementation

procedure TCtrlDesenhoDemo.OnCreateAppServer;
begin
  inherited;
  FCdsDesenhoDemo := TClientDataSet.Create(nil);
  FCdsReports     := TClientDataSet.Create(nil);

end;

constructor TCtrlDesenhoDemo.Create;
begin
  inherited;
  FdbDesenhoDemo  := TDbDesenhoDemo.Create(Self);
  FdbReports      := TDbReports.Create(Self);

end;

destructor TCtrlDesenhoDemo.Destroy;
begin
  inherited;

  FdbDesenhoDemo.Free;
  FdbReports.Free;

  If isAppServer then
  Begin
    FCdsDesenhoDemo.Free;
    FCdsReports.Free;
 End;
end;


function TCtrlDesenhoDemo.ListDesenhoDemo(dIdDesenho:Double) :OleVariant;
var
  sSql, sfiltro, sOrdena :string;
begin

      sSql := 'SELECT  ' +
              '   IDDESENHODEMO,   ' +
              '   IDDEMONSTRATIVO, ' +
              '   IDREPORTS,       ' +
              '   ORIGEMCM,        ' +
              '   FLGTIPOLAYOUT,   ' +
              '   NOMELAYOUT       ' +
              'FROM ' +
              '   DESENHODEMO ';
      //--------------------------------------
      sfiltro := '';
      If (dIdDesenho <> 0) Then
         sfiltro :=   'WHERE (IDDESENHODEMO = ' + FloatToStr(dIdDesenho) + ') ';
     //----------------------------------------------------------
     sOrdena := 'ORDER BY NOMELAYOUT ';

     sSql := Ssql + sFiltro + sOrdena;

     Result := GetDataPacket(sSql);
end;

function TCtrlDesenhoDemo.ListReports(dIdReports,dOrigemCM :Double) :OleVariant;
var
  sSql, sfiltro, sOrdena :string;
begin

      sSql := 'SELECT  ' +
              '  NAME,      ' +
              '  IDREPORTS, ' +
              '  ORIGEMCM,  ' +
              '  TEMPLATE   ' +
              'FROM  ' +
              '  REPORTS ' +
              ' WHERE (IDREPORTS = ' + FloatToStr( dIdReports ) + ' ) ' +
              ' AND ( ORIGEMCM = ' + FloatToStr( dOrigemCM ) + ' ) ' +
              ' ORDER BY NAME ';

     Result := GetDataPacket(sSql);
end;

function TCtrlDesenhoDemo.ListCdsDemoColunado:OleVariant;
var
  sSql :string;
begin

 sSql := 'SELECT  ' +
         '    (''                      '') as Patro,       ' +
         '    (''                      '') as Plano,       ' +

         '    (0) AS Coluna1,                              ' +
         '    (0) AS Coluna2,                              ' +
         '    (0) AS Coluna3,                              ' +
         '    (0) AS Coluna4,                              ' +
         '    (0) AS Coluna5,                              ' +
         '    (0) AS Coluna6,                              ' +
         '    (0) AS Coluna7,                              ' +
         '    (0) AS Coluna8,                              ' +
         '    (0) AS Coluna9,                              ' +
         '    (0) AS Coluna10,                             ' +
         '    (0) AS Coluna11,                             ' +
         '    (0) AS Coluna12,                             ' +
         '    (0) AS PercEntrePrim_Ult,                    ' +
         '    (0) AS SomatorioLinha,                       ' +
         '    (''-'') AS Coluna1s,                         ' +
         '    (''-'') AS Coluna2s,                         ' +
         '    (''-'') AS Coluna3s,                         ' +
         '    (''-'') AS Coluna4s,                         ' +
         '    (''-'') AS Coluna5s,                         ' +
         '    (''-'') AS Coluna6s,                         ' +
         '    (''-'') AS Coluna7s,                         ' +
         '    (''-'') AS Coluna8s,                         ' +
         '    (''-'') AS Coluna9s,                         ' +
         '    (''-'') AS Coluna10s,                        ' +
         '    (''-'') AS Coluna11s,                        ' +
         '    (''-'') AS Coluna12s,                        ' +
         '    (''-'') AS PercEntrePrim_Ults,               ' +
         '    (''-'') AS SomatorioLinhas,                  ' +
         '    (''N'') AS FlagCalcInterna1,                 ' +
         '    (''N'') AS FlagCalcInterna2,                 ' +
         '    (''N'') AS FlagCalcInterna3,                 ' +
         '    (''N'') AS FlagCalcInterna4,                 ' +
         '    (''N'') AS FlagCalcInterna5,                 ' +
         '    (''N'') AS FlagCalcInterna6,                 ' +
         '    (''N'') AS FlagCalcInterna7,                 ' +
         '    (''N'') AS FlagCalcInterna8,                 ' +
         '    (''N'') AS FlagCalcInterna9,                 ' +
         '    (''N'') AS FlagCalcInterna10,                ' +
         '    (''N'') AS FlagCalcInterna11,                ' +
         '    (''N'') AS FlagCalcInterna12,                ' +
         '    L.FLGPASSATRACO, (''N'') AS FLGTRACOSIMPLES, ' +
         '    (''N'') AS FLGTRACODUPLO,                    ' +
         '    L.NOMELINHA AS NomeLinha,                    ' +
         '    L.IDLINHA AS CodigoLinha,                    ' +
         '    L.ORDEMLINHA AS OrdemLinha,                  ' +
         '    L.FLGNATUREZA AS NaturezaElemento,           ' +
         '    (''         '') AS DATAULTDIA,               ' +
         '    L.FLGMONETARIA AS FlagMonetaria,             ' +
         '    (''          '') AS CCusto,                  ' +
         '    (''          '') AS AtivProj,                ' +
         '    (''               '') AS PERIODOINI,         ' +
         '    (''               '') AS PERIODOFIM,         ' +
         '    (''    '') AS EXERCICIO                      ' +
         'FROM  ' +                                          
         '    DEMLINHA L ';

        Result := GetDataPacket(sSql);

end;

function TCtrlDesenhoDemo.ListCdsDemoBalPatr:OleVariant;
var
  sSql :string;
begin

 sSql := 'SELECT  ' +
         '   (''                               '') as Patro,       ' +
         '   (''                               '') as Plano,       ' +

         '(0) AS Pos01Col1Valor, (''                                                  '') AS Pos01Col1Descr,  ' +
         '(0) AS Pos02Col1Valor, (''                                                  '') AS Pos02Col1Descr,  ' +
         '(0) AS Pos03Col1Valor, (''                                                  '') AS Pos03Col1Descr,  ' +
         '(0) AS Pos04Col1Valor, (''                                                  '') AS Pos04Col1Descr,  ' +
         '(0) AS Pos05Col1Valor, (''                                                  '') AS Pos05Col1Descr,  ' +
         '(0) AS Pos06Col1Valor, (''                                                  '') AS Pos06Col1Descr,  ' +
         '(0) AS Pos07Col1Valor, (''                                                  '') AS Pos07Col1Descr,  ' +
         '(0) AS Pos08Col1Valor, (''                                                  '') AS Pos08Col1Descr,  ' +
         '(0) AS Pos09Col1Valor, (''                                                  '') AS Pos09Col1Descr,  ' +
         '(0) AS Pos10Col1Valor, (''                                                  '') AS Pos10Col1Descr,  ' +
         '(0) AS Pos11Col1Valor, (''                                                  '') AS Pos11Col1Descr,  ' +
         '(0) AS Pos12Col1Valor, (''                                                  '') AS Pos12Col1Descr,  ' +
         '(0) AS Pos13Col1Valor, (''                                                  '') AS Pos13Col1Descr,  ' +
         '(0) AS Pos14Col1Valor, (''                                                  '') AS Pos14Col1Descr,  ' +
         '(0) AS Pos15Col1Valor, (''                                                  '') AS Pos15Col1Descr,  ' +
         '(0) AS Pos16Col1Valor, (''                                                  '') AS Pos16Col1Descr,  ' +
         '(0) AS Pos17Col1Valor, (''                                                  '') AS Pos17Col1Descr,  ' +
         '(0) AS Pos18Col1Valor, (''                                                  '') AS Pos18Col1Descr,  ' +
         '(0) AS Pos19Col1Valor, (''                                                  '') AS Pos19Col1Descr,  ' +
         '(0) AS Pos20Col1Valor, (''                                                  '') AS Pos20Col1Descr,  ' +
         '(0) AS Pos21Col1Valor, (''                                                  '') AS Pos21Col1Descr,  ' +
         '(0) AS Pos22Col1Valor, (''                                                  '') AS Pos22Col1Descr,  ' +
         '(0) AS Pos23Col1Valor, (''                                                  '') AS Pos23Col1Descr,  ' +
         '(0) AS Pos24Col1Valor, (''                                                  '') AS Pos24Col1Descr,  ' +
         '(0) AS Pos25Col1Valor, (''                                                  '') AS Pos25Col1Descr,  ' +
         '(0) AS Pos26Col1Valor, (''                                                  '') AS Pos26Col1Descr,  ' +
         '(0) AS Pos27Col1Valor, (''                                                  '') AS Pos27Col1Descr,  ' +
         '(0) AS Pos28Col1Valor, (''                                                  '') AS Pos28Col1Descr,  ' +
         '(0) AS Pos29Col1Valor, (''                                                  '') AS Pos29Col1Descr,  ' +
         '(0) AS Pos30Col1Valor, (''                                                  '') AS Pos30Col1Descr,  ' +
         '(0) AS Pos01Col2Valor, (''                                                  '') AS Pos01Col2Descr,  ' +
         '(0) AS Pos02Col2Valor, (''                                                  '') AS Pos02Col2Descr,  ' +
         '(0) AS Pos03Col2Valor, (''                                                  '') AS Pos03Col2Descr,  ' +
         '(0) AS Pos04Col2Valor, (''                                                  '') AS Pos04Col2Descr,  ' +
         '(0) AS Pos05Col2Valor, (''                                                  '') AS Pos05Col2Descr,  ' +
         '(0) AS Pos06Col2Valor, (''                                                  '') AS Pos06Col2Descr,  ' +
         '(0) AS Pos07Col2Valor, (''                                                  '') AS Pos07Col2Descr,  ' +
         '(0) AS Pos08Col2Valor, (''                                                  '') AS Pos08Col2Descr,  ' +
         '(0) AS Pos09Col2Valor, (''                                                  '') AS Pos09Col2Descr,  ' +
         '(0) AS Pos10Col2Valor, (''                                                  '') AS Pos10Col2Descr,  ' +
         '(0) AS Pos11Col2Valor, (''                                                  '') AS Pos11Col2Descr,  ' +
         '(0) AS Pos12Col2Valor, (''                                                  '') AS Pos12Col2Descr,  ' +
         '(0) AS Pos13Col2Valor, (''                                                  '') AS Pos13Col2Descr,  ' +
         '(0) AS Pos14Col2Valor, (''                                                  '') AS Pos14Col2Descr,  ' +
         '(0) AS Pos15Col2Valor, (''                                                  '') AS Pos15Col2Descr,  ' +
         '(0) AS Pos16Col2Valor, (''                                                  '') AS Pos16Col2Descr,  ' +
         '(0) AS Pos17Col2Valor, (''                                                  '') AS Pos17Col2Descr,  ' +
         '(0) AS Pos18Col2Valor, (''                                                  '') AS Pos18Col2Descr,  ' +
         '(0) AS Pos19Col2Valor, (''                                                  '') AS Pos19Col2Descr,  ' +
         '(0) AS Pos20Col2Valor, (''                                                  '') AS Pos20Col2Descr,  ' +
         '(0) AS Pos21Col2Valor, (''                                                  '') AS Pos21Col2Descr,  ' +
         '(0) AS Pos22Col2Valor, (''                                                  '') AS Pos22Col2Descr,  ' +
         '(0) AS Pos23Col2Valor, (''                                                  '') AS Pos23Col2Descr,  ' +
         '(0) AS Pos24Col2Valor, (''                                                  '') AS Pos24Col2Descr,  ' +
         '(0) AS Pos25Col2Valor, (''                                                  '') AS Pos25Col2Descr,  ' +
         '(0) AS Pos26Col2Valor, (''                                                  '') AS Pos26Col2Descr,  ' +
         '(0) AS Pos27Col2Valor, (''                                                  '') AS Pos27Col2Descr,  ' +
         '(0) AS Pos28Col2Valor, (''                                                  '') AS Pos28Col2Descr,  ' +
         '(0) AS Pos29Col2Valor, (''                                                  '') AS Pos29Col2Descr,  ' +
         '(0) AS Pos30Col2Valor, (''                                                  '') AS Pos30Col2Descr,  ' +
         '(0) AS Pos31Col1Valor, (''                                                  '') AS Pos31Col1Descr,  ' +
         '(0) AS Pos32Col1Valor, (''                                                  '') AS Pos32Col1Descr,  ' +
         '(0) AS Pos33Col1Valor, (''                                                  '') AS Pos33Col1Descr,  ' +
         '(0) AS Pos34Col1Valor, (''                                                  '') AS Pos34Col1Descr,  ' +
         '(0) AS Pos35Col1Valor, (''                                                  '') AS Pos35Col1Descr,  ' +
         '(0) AS Pos36Col1Valor, (''                                                  '') AS Pos36Col1Descr,  ' +
         '(0) AS Pos37Col1Valor, (''                                                  '') AS Pos37Col1Descr,  ' +
         '(0) AS Pos38Col1Valor, (''                                                  '') AS Pos38Col1Descr,  ' +
         '(0) AS Pos39Col1Valor, (''                                                  '') AS Pos39Col1Descr,  ' +
         '(0) AS Pos40Col1Valor, (''                                                  '') AS Pos40Col1Descr,  ' +
         '(0) AS Pos31Col2Valor, (''                                                  '') AS Pos31Col2Descr,  ' +
         '(0) AS Pos32Col2Valor, (''                                                  '') AS Pos32Col2Descr,  ' +
         '(0) AS Pos33Col2Valor, (''                                                  '') AS Pos33Col2Descr,  ' +
         '(0) AS Pos34Col2Valor, (''                                                  '') AS Pos34Col2Descr,  ' +
         '(0) AS Pos35Col2Valor, (''                                                  '') AS Pos35Col2Descr,  ' +
         '(0) AS Pos36Col2Valor, (''                                                  '') AS Pos36Col2Descr,  ' +
         '(0) AS Pos37Col2Valor, (''                                                  '') AS Pos37Col2Descr,  ' +
         '(0) AS Pos38Col2Valor, (''                                                  '') AS Pos38Col2Descr,  ' +
         '(0) AS Pos39Col2Valor, (''                                                  '') AS Pos39Col2Descr,  ' +
         '(0) AS Pos40Col2Valor, (''                                                  '') AS Pos40Col2Descr,  ' +
         '(0) AS Pos01Col1SalEANT, ' +
         '(0) AS Pos02Col1SalEANT, ' +
         '(0) AS Pos03Col1SalEANT, ' +
         '(0) AS Pos04Col1SalEANT, ' +
         '(0) AS Pos05Col1SalEANT, ' +
         '(0) AS Pos06Col1SalEANT, ' +
         '(0) AS Pos07Col1SalEANT, ' +
         '(0) AS Pos08Col1SalEANT, ' +
         '(0) AS Pos09Col1SalEANT, ' +
         '(0) AS Pos10Col1SalEANT, ' +
         '(0) AS Pos11Col1SalEANT, ' +
         '(0) AS Pos12Col1SalEANT, ' +
         '(0) AS Pos13Col1SalEANT, ' +
         '(0) AS Pos14Col1SalEANT, ' +
         '(0) AS Pos15Col1SalEANT, ' +
         '(0) AS Pos16Col1SalEANT, ' +
         '(0) AS Pos17Col1SalEANT, ' +
         '(0) AS Pos18Col1SalEANT, ' +
         '(0) AS Pos19Col1SalEANT, ' +
         '(0) AS Pos20Col1SalEANT, ' +
         '(0) AS Pos21Col1SalEANT, ' +
         '(0) AS Pos22Col1SalEANT, ' +
         '(0) AS Pos23Col1SalEANT, ' +
         '(0) AS Pos24Col1SalEANT, ' +
         '(0) AS Pos25Col1SalEANT, ' +
         '(0) AS Pos26Col1SalEANT, ' +
         '(0) AS Pos27Col1SalEANT, ' +
         '(0) AS Pos28Col1SalEANT, ' +
         '(0) AS Pos29Col1SalEANT, ' +
         '(0) AS Pos30Col1SalEANT, ' +
         '(0) AS Pos31Col1SalEANT, ' +
         '(0) AS Pos32Col1SalEANT, ' +
         '(0) AS Pos33Col1SalEANT, ' +
         '(0) AS Pos34Col1SalEANT, ' +
         '(0) AS Pos35Col1SalEANT, ' +
         '(0) AS Pos36Col1SalEANT, ' +
         '(0) AS Pos37Col1SalEANT, ' +
         '(0) AS Pos38Col1SalEANT, ' +
         '(0) AS Pos39Col1SalEANT, ' +
         '(0) AS Pos40Col1SalEANT, ' +
         '(0) AS Pos01Col2SalEANT, ' +
         '(0) AS Pos02Col2SalEANT, ' +
         '(0) AS Pos03Col2SalEANT, ' +
         '(0) AS Pos04Col2SalEANT, ' +
         '(0) AS Pos05Col2SalEANT, ' +
         '(0) AS Pos06Col2SalEANT, ' +
         '(0) AS Pos07Col2SalEANT, ' +

         '(0) AS Pos08Col2SalEANT, ' +
         '(0) AS Pos09Col2SalEANT, ' +

         '(0) AS Pos10Col2SalEANT, ' +
         '(0) AS Pos11Col2SalEANT, ' +
         '(0) AS Pos12Col2SalEANT, ' +
         '(0) AS Pos13Col2SalEANT, ' +
         '(0) AS Pos14Col2SalEANT, ' +
         '(0) AS Pos15Col2SalEANT, ' +
         '(0) AS Pos16Col2SalEANT, ' +
         '(0) AS Pos17Col2SalEANT, ' +
         '(0) AS Pos18Col2SalEANT, ' +
         '(0) AS Pos19Col2SalEANT, ' +
         '(0) AS Pos20Col2SalEANT, ' +
         '(0) AS Pos21Col2SalEANT, ' +
         '(0) AS Pos22Col2SalEANT, ' +
         '(0) AS Pos23Col2SalEANT, ' +
         '(0) AS Pos24Col2SalEANT, ' +
         '(0) AS Pos25Col2SalEANT, ' +
         '(0) AS Pos26Col2SalEANT, ' +
         '(0) AS Pos27Col2SalEANT, ' +
         '(0) AS Pos28Col2SalEANT, ' +
         '(0) AS Pos29Col2SalEANT, ' +
         '(0) AS Pos30Col2SalEANT, ' +
         '(0) AS Pos31Col2SalEANT, ' +
         '(0) AS Pos32Col2SalEANT, ' +
         '(0) AS Pos33Col2SalEANT, ' +
         '(0) AS Pos34Col2SalEANT, ' +
         '(0) AS Pos35Col2SalEANT, ' +
         '(0) AS Pos36Col2SalEANT, ' +
         '(0) AS Pos37Col2SalEANT, ' +
         '(0) AS Pos38Col2SalEANT, ' +
         '(0) AS Pos39Col2SalEANT, ' +
         '(0) AS Pos40Col2SalEANT, ' +
         '(''          '')      AS CCusto,      ' +
         '(''          '')      AS AtivProj,    ' +
         '(''         '')       AS DATAULTDIA,  ' +
         '(''               '') AS PERIODOINI,  ' +
         '(''               '') AS PERIODOFIM,  ' +
         '(''    '')            AS EXERCICIO,   ' +

         '(''    '')            AS EXERCICIOANT ' +

         'FROM ' +
         '   PESSOA ' +
         'WHERE (IDPESSOA = 1) ';

     //---------------------------------------------------
     Result := GetDataPacket(sSql);

end;


function TCtrlDesenhoDemo.ListCdsDemoColMes:OleVariant;
var
  sSql :string;
begin

     sSql := 'SELECT  ' +
             '   (''                               '') as Patro,       ' +
             '   (''                               '') as Plano,       ' +

             '    (0) AS M01_Janeiro,    ' +
             '    (0) AS M02_Fevereiro,  ' +
             '    (0) AS M03_Marco,      ' +
             '    (0) AS M04_Abril,      ' +
             '    (0) AS M05_Maio,       ' +
             '    (0) AS M06_Junho,      ' +
             '    (0) AS M07_Julho,      ' +
             '    (0) AS M08_Agosto,     ' +
             '    (0) AS M09_Setembro,   ' +
             '    (0) AS M10_Outubro,    ' +
             '    (0) AS M11_Novembro,   ' +
             '    (0) AS M12_Dezembro,   ' +
             '    (0) AS O01_Janeiro,    ' +
             '    (0) AS O02_Fevereiro,  ' +
             '    (0) AS O03_Marco,      ' +
             '    (0) AS O04_Abril,      ' +
             '    (0) AS O05_Maio,       ' +
             '    (0) AS O06_Junho,      ' +
             '    (0) AS O07_Julho,      ' +
             '    (0) AS O08_Agosto,     ' +
             '    (0) AS O09_Setembro,   ' +
             '    (0) AS O10_Outubro,    ' +
             '    (0) AS O11_Novembro,   ' +
             '    (0) AS O12_Dezembro,   ' +
             '    (0) AS M01_JaneiroS,   ' +
             '    (0) AS M02_FevereiroS, ' +
             '    (0) AS M03_MarcoS,     ' +
             '    (0) AS M04_AbrilS,     ' +
             '    (0) AS M05_MaioS,      ' +
             '    (0) AS M06_JunhoS,     ' +
             '    (0) AS M07_JulhoS,     ' +
             '    (0) AS M08_AgostoS,    ' +
             '    (0) AS M09_SetembroS,  ' +
             '    (0) AS M10_OutubroS,   ' +
             '    (0) AS M11_NovembroS,  ' +
             '    (0) AS M12_DezembroS,  ' +
             '    (0) AS O01_JaneiroS,   ' +
             '    (0) AS O02_FevereiroS, ' +
             '    (0) AS O03_MarcoS,     ' +
             '    (0) AS O04_AbrilS,     ' +
             '    (0) AS O05_MaioS,      ' +
             '    (0) AS O06_JunhoS,     ' +
             '    (0) AS O07_JulhoS,     ' +
             '    (0) AS O08_AgostoS,    ' +
             '    (0) AS O09_SetembroS,  ' +
             '    (0) AS O10_OutubroS,   ' +
             '    (0) AS O11_NovembroS,  ' +
             '    (0) AS O12_DezembroS,  ' +
             '    (0) AS SomatorioLinha, ' +
             '    (''N'') AS FlagCalcInterna,    ' +
             '    (''          '') AS CCusto,    ' +
             '    (''          '') AS AtivProj,  ' +
             '    (0) AS SomatLinhaOrc,          ' +
             '    (''                                                                              '') AS NomeElementoInd, ' +
             '    E.ELEDESCELEM AS NomeElemento,         ' +
             '    E.ELEORDEMLINHA AS OrdemElemento,      ' +
             '    E.IDELEMDEMONSTRAT AS CodigoElemento,  ' +
             '    E.ELETIPOELEM AS TipoElemento,         ' +
             '    E.FLGNATUREZA AS NaturezaElemento,     ' +
             '    E.FLGINDENTACAO AS Indentacao,         ' +
             '    E.FLGMONETARIA AS FlagMonetaria,       ' +
             '    E.FLGTIPONEGATIVO AS FlagTipoNegativo, ' +
             '    E.ELECODIGO AS Codigo, ' +
             '    ('' '') AS SaltaPag,   ' +
             '    ('' '') AS Linha1,     ' +
             '    ('' '') AS Linha2,     ' +
             '    ('' '') AS Linha3,     ' +
             '    (''         '') AS DATAULTDIA,       ' +
             '    E.FLGSALTAPAGINA AS FlagInterna1,    ' +
             '    E.FLGTIPOLINHA AS FlagInterna2,      ' +
             '    (''               '') AS PERIODOINI, ' +
             '    (''               '') AS PERIODOFIM, ' +
             '    (''    '') AS EXERCICIO ' +
             'FROM   ' +
             '    ELEMDEMONSTRATIVO E  ';

     //---------------------------------------------------
     Result := GetDataPacket(sSql);


end;

function TCtrlDesenhoDemo.ListCdsDemoNormal:OleVariant;
var
  sSql :string;
begin

     sSql := 'SELECT  ' +
             '   (''                               '') as Patro,       ' +
             '   (''                               '') as Plano,       ' +

             '    (0) AS SaldoRealPerEAT,                 ' +
             '    (0) AS SaldoOrcPerEAT,                  ' +
             '    (0) AS SaldoRealAcumEAT,                ' +
             '    (0) AS SaldoOrcAcumEAT,                 ' +
             '    (0) AS SaldoRealPerEAN,                 ' +
             '    (0) AS SaldoRealAcumEAN,                ' +
             '    (0) AS SaldoReaPerAntEAT,               ' +
             '    (0) AS SaldRealPerEATS,                 ' +
             '    (0) AS SaldOrcPerEATS,                  ' +
             '    (0) AS SaldRealAcumEATS,                ' +
             '    (0) AS SaldOrcAcumEATS,                 ' +
             '    (0) AS SaldRealPerEANS,                 ' +
             '    (0) AS SaldRealAcumEANS,                ' +
             '    (0) AS SaldReaPerAntEATS,               ' +
             '    (0) AS DifOrcRealPerEAT,                ' +
             '    (0) AS AV_RealPerEAT,                   ' +
             '    (0) AS AV_OrcPerEAT,                    ' +
             '    (0) AS AH_OrcRealPerEAT,                ' +
             '    (0) AS DifOrcRealAcumEAT,               ' +
             '    (0) AS AV_RealAcumEAT,                  ' +
             '    (0) AS AV_OrcAcumEAT,                   ' +
             '    (0) AS AH_OrcRealAcumEAT,               ' +
             '    (0) AS DifExAtuAntPer,                  ' +
             '    (0) AS AV_RealPerEAN,                   ' +
             '    (0) AS AH_ExAtuAntPer,                  ' +
             '    (0) AS DifExAtuAntAcum,                 ' +
             '    (0) AS AV_RealAcumEAN,                  ' +
             '    (0) AS AH_ExAtuAntAcum,                 ' +
             '    (0) AS DifPerAtuAntEAT,                 ' +
             '    (0) AS AV_RealPerAntEAT,                ' +
             '    (0) AS AH_PerAtuAntEAT,                 ' +
             '    (0) AS SaldoIniEAT,                     ' +
             '    (0) AS TotalDebPerEAT,                  ' +
             '    (0) AS TotalCrePerEAT,                  ' +
             '    (0) AS MovPerEAT,                       ' +
             '    (''N'') AS FlagCalcInterna,             ' +
             '    E.FLGTIPONEGATIVO AS FlagTipoNegativo,  ' +
             '    (''                                                                              '') AS NomeElementoInd, ' +
             '    E.ELEDESCELEM AS NomeElemento,          ' +
             '    E.ELEORDEMLINHA AS OrdemElemento,       ' +
             '    E.IDELEMDEMONSTRAT AS CodigoElemento,   ' +
             '    E.ELETIPOELEM AS TipoElemento,          ' +
             '    E.FLGNATUREZA AS NaturezaElemento,      ' +
             '    E.FLGINDENTACAO AS Indentacao,          ' +
             '    E.FLGMONETARIA AS FlagMonetaria,        ' +
             '    E.IDELEMANAVERTICAL AS ElemAnaliseVert, ' +
             '    E.ELECODIGO AS Codigo,                  ' +
             '    ('' '') AS SaltaPag,                    ' +
             '    ('' '') AS Linha1,                      ' +
             '    (''         '') AS DATAULTDIA,          ' +
             '    ('' '') AS Linha2,                      ' +
             '    ('' '') AS Linha3,                      ' +
             '    (''          '') AS CCusto,             ' +
             '    (''          '') AS AtivProj,           ' +
             '    E.FLGSALTAPAGINA AS FlagInterna1,       ' +
             '    E.FLGTIPOLINHA AS FlagInterna2,         ' +
             '    (''               '') AS PERIODOINI,    ' +
             '    (''               '') AS PERIODOFIM,    ' +
             '    (''    '') AS EXERCICIO,                ' +

             '    (''    '') AS EXERCICIOANT              ' +

             'FROM ' +
             '    ELEMDEMONSTRATIVO E ';

     //---------------------------------------------------
     Result := GetDataPacket(sSql);
end;

function TCtrlDesenhoDemo.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarDesenhoDemo (FcdsReports.Data,FcdsDesenhoDemo.Data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(FcdsReports,FdbReports,[],[] );
           Msg    := FdbReports.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
           //
           Result := ApplyCds(FcdsDesenhoDemo,FdbDesenhoDemo,[FdbReports.Idreports],[FdbDesenhoDemo.Idreports]);
           Msg    := FdbDesenhoDemo.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;

procedure TCtrlDesenhoDemo.DoChangeDataBase;
begin
  inherited;
  FdbDesenhoDemo.DataBaseName := DataBaseName;
  FdbReports.DataBaseName := DataBaseName
end;

procedure TCtrlDesenhoDemo.SetCdsDesenhoDemo(const Value: TClientDataSet);
begin
  FCdsDesenhoDemo := Value;
end;




procedure TCtrlDesenhoDemo.SetCdsReports(const Value: TClientDataSet);
begin
  FCdsReports := Value;

end;


function TCtrlDesenhoDemo.Apagar: Boolean;
var
   Msg  : String;
begin
   {Funcão implementada na Aplicação Servidora}
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ApagarDesenhoDemo (FcdsDesenhoDemo.Data,FcdsReports.Data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else
  Begin
     Try
         StartTransaction;

         Result := ApplyCds(FcdsDesenhoDemo,FdbDesenhoDemo,[],[]);
         Msg    := FdbDesenhoDemo.MessageInfo;
         If Not Result Then Raise Exception.Create(Msg);

         Result := ApplyCds(FcdsReports,FdbReports,[],[] );
         Msg    := FdbReports.MessageInfo;
         If Not Result Then Raise Exception.Create(Msg);

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

end.
