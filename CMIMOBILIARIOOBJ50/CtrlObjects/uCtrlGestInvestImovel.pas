{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 26054
Data........: 26/12/2016
Responsável.: Michelle Suellyn Mota /Darivaldo Alencar
Descrição...: Criação da tela Gestão de Investimento - Imóvel.
--------------------------------------------------------------------------------}

unit uCtrlGestInvestImovel;

interface

uses
  SysUtils, DB, uCMControlObject, uCMDbObject ,
  uCMTypes, uSistema, dbtables, classes,UDataBase,Wwquery,
  dbClient, uCMClientDataSet;

type
  TCtrlGestInvestImovel = class(TCMControlObject)

  private
  protected
    procedure AfterInitialize;   override;
    procedure OnCreateAppServer; override;

  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListVoto(sIdVoto: string): String;
    function ListImovelVoto(sIdVoto: string): string;
    function ListDocumento(IDVOTO, IDDOC: string): String;
    function ListDocGrid(IDVOTO: string): String;
    function ListUnidades(ID: string): OleVariant;
    function ListFornecedor(ID: string): OLEVariant;
    function ListaImovel(ID: string): OLEVariant;
    function GetProxCod(tabela, campo: string): Integer;
    function getQueryMS(sFiltro:String):String;
    function getImoveisMestres(IDVOTO: string):String;
    function getImoveisUnidades(IDVOTO: string):String;
    function getImoveisChecados(IDVOTO: string):String;
    function getListaImoveisUnidadeDoMestre(IDVOTO: string):String;
    function ListImovelVotoMestres(sIdVoto: string): string;
    function ListImovelVotoUnidade(sIdVoto,sIdMestre: string): string;

  published

end;

implementation

{ TCtrlGestInvestImovel }

constructor TCtrlGestInvestImovel.Create;
begin
  inherited;
end;

destructor TCtrlGestInvestImovel.Destroy;
begin
 inherited;
end;

procedure TCtrlGestInvestImovel.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlGestInvestImovel.AfterInitialize;
begin
  inherited;
end;

function TCtrlGestInvestImovel.ListVoto(sIdVoto: string): String;
var
  sSql : String;
begin
  sSql := 'SELECT * ' +
          '  FROM VOTOGESTAOIMOVEL ' +
          '  WHERE IDVOTOGESTAOIMOVEL = ' + sIdVoto+
              ' ORDER BY 1';

  Result :=  sSql ;
end;

function TCtrlGestInvestImovel.ListImovelVoto(sIdVoto: string): string;
var
  sSql : String;
begin
  sSql := 'SELECT * ' +
          '  FROM IMOVEISXVOTO ' +
          '  WHERE IDVOTOGESTAOIMOVEL =  ' + sIdVoto+
              ' ORDER BY 1';

  Result := ( sSql );
end;

function TCtrlGestInvestImovel.ListImovelVotoMestres(sIdVoto: string): string;
var
  sSql : String;
begin
  sSql := 'SELECT IV.*' + #13#10 +
          '  FROM IMOVEISXVOTO IV' + #13#10 +
          ' INNER JOIN IMOVEL IM' + #13#10 +
          '    ON IV.IDIMOVEL = IM.IDIMOVEL' + #13#10 +
          '   AND IM.FLGTIPOIMOVEL = 0' + #13#10 +
          ' WHERE IDVOTOGESTAOIMOVEL ='+ sIdVoto + #13#10 +
          ' ORDER BY 1';
  Result := ( sSql );
end;

function TCtrlGestInvestImovel.ListImovelVotoUnidade(sIdVoto,sIdMestre: string): string;
var
  sSql : String;
begin
  sSql := 'SELECT IV.*,IM.IDIMOVELMESTRE' + #13#10 +
          '  FROM IMOVEISXVOTO IV' + #13#10 +
          ' INNER JOIN IMOVEL IM' + #13#10 +
          '    ON IV.IDIMOVEL = IM.IDIMOVEL' + #13#10 +
          ' WHERE IDVOTOGESTAOIMOVEL = '+ sIdVoto + #13#10 +
          '       AND IDIMOVELMESTRE = '+ sIdMestre + #13#10 +
          '       AND FLGTIPOIMOVEL = 1' + #13#10 +
          ' ORDER BY 1';

  Result := ( sSql );
end;

function TCtrlGestInvestImovel.ListDocumento(IDVOTO, IDDOC: string): String;
var
  sSql : String;
begin
  sSql := 'SELECT * ' +
          '  FROM DOCUMENTOXVOTO DV ' +
          '  WHERE DV.IDVOTOGESTAOIMOVEL = ' + IDVOTO +
          '    AND DV.IDDOCUMENTOXVOTO = ' + IDDOC+
              ' ORDER BY 1';

  Result := ( sSql );
end;

function TCtrlGestInvestImovel.ListDocGrid(IDVOTO: string): String;
var
  sSql : String;
begin
              {campos na grid
              'DATAEMISSAO'#9'18'#9'Data'
              'NODOCUMENTO'#9'20'#9'Documento'
              'NUMAPGR'#9'20'#9'Número do AP'
              'VALOR'#9'10'#9'Valor'
              'STATUS'#9'10'#9'Status'
              'SALDO'#9'20'#9'Saldo'}
  sSql := 'SELECT DATAEMISSAO, NODOCUMENTO, NUMAPGR, SUM(VLRTOTDOC) as VALOR, '+
          '       STATUS, IDDOCUMENTOXVOTO, SALDO - SUM(VLRTOTDOC) AS SALDO, IDVOTOGESTAOIMOVEL, CODDOCUMENTO,NUMLANCTO '+
          '  FROM (SELECT DOC.CODDOCUMENTO,DV.IDVOTOGESTAOIMOVEL,DV.IDDOCUMENTOXVOTO, '+
          '               DOC.DATAEMISSAO, '+
          '               DOC.NODOCUMENTO, '+
          '               DOC.NUMAPGR, '+
          '               DECODE(DOC.RECPAG, '+
          '                      ''P'', '+
          '                      DECODE(LD.DEBCRE, '+
          '                             ''D'', '+
          '                             SUM(LD.VALOR) * (-1), '+
          '                             SUM(LD.VALOR)), '+
          '                      0) + DECODE(DOC.RECPAG, '+
          '                                  ''R'', '+
          '                                  DECODE(LD.DEBCRE, '+
          '                                         ''C'', '+
          '                                         SUM(LD.VALOR) * (-1), '+
          '                                         SUM(LD.VALOR)), '+
          '                                  0) as VLRTOTDOC, '+
          '               case DOC.STATUS                        '+
          '                 when ''0'' then                         '+
          '                  ''Aberto''                            '+
          '                 when ''1'' then                       '+
          '                  ''Cobrança emitida''                         '+
          '                 when ''2'' then                       '+
          '                  ''Recebido/Pago''                         '+
          '               end STATUS,                            '+
          '               VT.VLRAPROVADO AS SALDO,                '+
          '               DV.NUMLANCTO                            '+                          
          '          FROM DOCUMENTO DOC, LANCTODOCUM LD, DOCUMENTOXVOTO DV, VOTOGESTAOIMOVEL VT '+
          '         WHERE DOC.CODDOCUMENTO = LD.CODDOCUMENTO '+
          '           AND DOC.CODDOCUMENTO = DV.CODDOCUMENTO '+
          '           AND VT.IDVOTOGESTAOIMOVEL = DV.IDVOTOGESTAOIMOVEL '+
          '           AND LD.OPERACAO <> 5 '+
          '         GROUP BY DOC.CODDOCUMENTO, '+
          '                  DOC.DATAEMISSAO, '+
          '                  DOC.NODOCUMENTO, '+
          '                  DOC.NUMAPGR, '+
          '                  DOC.RECPAG, '+
          '                  LD.DEBCRE, '+
          '                  DOC.STATUS, '+
          '                  DV.IDVOTOGESTAOIMOVEL,DV.IDDOCUMENTOXVOTO,DV.NUMLANCTO,VT.VLRAPROVADO) '+
          ' where IDVOTOGESTAOIMOVEL = ' + IDVOTO +
          ' GROUP BY DATAEMISSAO, NODOCUMENTO, NUMAPGR, STATUS,IDDOCUMENTOXVOTO,NUMLANCTO,SALDO,IDVOTOGESTAOIMOVEL, CODDOCUMENTO'+
              ' ORDER BY 1';

  Result := ( sSql );
end;

function TCtrlGestInvestImovel.GetProxCod(tabela, campo: string): Integer;
var
  sSQL: String;
  _qryAUX: TwwQuery;
begin
   try
     _qryAUX:= TwwQuery.create(nil);
     _qryAUX.DatabaseName:= 'BaseDados';

     sSQL:=  ' SELECT NVL(MAX('+campo+'+1),1) AS PROXIMA FROM ' + tabela;

     FazQuery(_qryAUX,sSQL);

     Result := _qryAUX.fieldbyname('PROXIMA').asInteger;
   finally
     FreeAndNil(_qryAUX);
   end;
end;

function TCtrlGestInvestImovel.getQueryMS(sFiltro:String):String;
var
  sSQL: String;
begin
  sSQL := 'SELECT ' +#13+
             '   NODOCUMENTO AS C0, ' +#13+
             '   DATAEMISSAO AS C1, ' +#13+
             '   NUMAPGR AS C2, ' +#13+
             '   SUM(VLRTOTDOC) AS C3, ' +#13+
             '   STATUS AS C4, ' +#13+
             '   NODOCUMENTO AS C5, ' +#13+
             '   DATAEMISSAO AS C6, ' +#13+
             '   NUMAPGR AS C7, ' +#13+
             '   SUM(VLRTOTDOC) AS C8, ' +#13+
             '   STATUS AS C9, ' +#13+
             '   CODDOCUMENTO AS C10, ' +#13+
             '   NUMLANCTO AS C11 ' +#13+
             '  FROM (SELECT ' +#13+
             '               DOC.CODDOCUMENTO, ' +#13+
             '               DOC.DATAEMISSAO, ' +#13+
             '               DOC.NODOCUMENTO, ' +#13+
             '               DOC.NUMAPGR, ' +#13+
             '               DECODE(DOC.RECPAG, ' +#13+
             '                      ''P'', ' +#13+
             '                      DECODE(LD.DEBCRE, ' +#13+
             '                             ''D'', ' +#13+
             '                             SUM(LD.VALOR) * -1, ' +#13+
             '                             SUM(LD.VALOR)), ' +#13+
             '                      0) + DECODE(DOC.RECPAG, ' +#13+
             '                                  ''R'', ' +#13+
             '                                  DECODE(LD.DEBCRE, ' +#13+
             '                                         ''C'', ' +#13+
             '                                         SUM(LD.VALOR) * -1, ' +#13+
             '                                         SUM(LD.VALOR)), ' +#13+
             '                                  0) as VLRTOTDOC, ' +#13+
             '               case DOC.STATUS ' +#13+
             '                 when ''0'' then                         '+#13+
             '                  ''Aberto''                            '+#13+
             '                 when ''1'' then                       '+#13+
             '                  ''Cobrança emitida''                         '+#13+
             '                 when ''2'' then                       '+#13+
             '                  ''Recebido/Pago''                         '+#13+
             '               end STATUS, ' +#13+
             '               LD.NUMLANCTO '+#13+
             '          FROM DOCUMENTO DOC, LANCTODOCUM LD ' +#13+
             '         ' + sFiltro +#13+
             '         GROUP BY ' +#13+
             '                  DOC.CODDOCUMENTO, ' +#13+
             '                  DOC.DATAEMISSAO, ' +#13+
             '                  DOC.NODOCUMENTO, ' +#13+
             '                  DOC.NUMAPGR, ' +#13+
             '                  DOC.RECPAG, ' +#13+
             '                  LD.DEBCRE, ' +#13+
             '                  LD.NUMLANCTO, '+#13+
             '                  DOC.STATUS) ' +#13+
             ' GROUP BY  DATAEMISSAO, NODOCUMENTO, NUMAPGR, STATUS, CODDOCUMENTO,NUMLANCTO ' +#13+
             ' ORDER BY 1';
   result:= sSQL;
end;

function TCtrlGestInvestImovel.ListUnidades(ID: string): OLEVariant;
var
  sSql : String;
begin
  sSql := 'SELECT IM.IMONOME ' +
          'FROM IMOVEL IM ' +
          'WHERE IM.FLGTIPOIMOVEL = 1 ' +
          '  AND IM.IDIMOVEL = ' + ID +
              ' ORDER BY 1';

  Result := GetDataPacket( sSql );
end;

function TCtrlGestInvestImovel.ListFornecedor(ID: string): OLEVariant;
var sSql : String;
begin
  sSql := 'SELECT    P.NUMDOCUMENTO,  P.NOME,   P.RAZAOSOCIAL, ' +
          '   P.NOME,    P.RAZAOSOCIAL ' +
          'FROM PESSOA P  ' +
          'WHERE IDPESSOA = ' + ID+
              ' ORDER BY 1';

  Result := GetDataPacket( sSql );
end;

function TCtrlGestInvestImovel.ListaImovel(ID: string): OLEVariant;
var sSql : String;
begin
  sSql := 'SELECT IM.IMONOME ' +
          'FROM IMOVEL IM ' +
          'WHERE ( IM.FLGTIPOIMOVEL = 0 )  ' +
          '  AND IM.IDIMOVELMESTRE = ' + ID +
              ' ORDER BY 1';

  Result := GetDataPacket( sSql );
end;

function TCtrlGestInvestImovel.getImoveisMestres(IDVOTO: string): String;
var sSql:String;
begin
     sSql:= 'SELECT IM.IMONOME, IM.IDIMOVEL  ' +
            'FROM IMOVEL IM, IMOVEISXVOTO IV ' +
            'WHERE IM.FLGTIPOIMOVEL = 0      ' +
            '  AND IM.IDIMOVEL = IV.IDIMOVEL ' +
            '  AND IV.IDVOTOGESTAOIMOVEL =   ' + IDVOTO +
            ' ORDER BY 1';
     result := sSql;
end;

function TCtrlGestInvestImovel.getImoveisUnidades(IDVOTO: string): String;
var sSql:String;
begin
   sSql:= 'SELECT IM.IMONOME, IM.IDIMOVEL        ' +
          'FROM IMOVEL IM, IMOVEISXVOTO IV       ' +
          'WHERE IM.FLGTIPOIMOVEL = 1            ' +
          '  AND IM.IDIMOVELMESTRE = IV.IDIMOVEL ' +
          '  AND IV.IDVOTOGESTAOIMOVEL =         ' + IDVOTO +
          ' ORDER BY 1';
   result := sSql;
end;

function TCtrlGestInvestImovel.getImoveisChecados(IDVOTO: string): String;
var sSql:String;
begin
  sSql:=  'SELECT IM.IMONOME, IM.IDIMOVEL  ' +
          'FROM IMOVEL IM, IMOVEISXVOTO IV ' +
          'WHERE IM.FLGTIPOIMOVEL = 1      ' +
          '  AND IM.IDIMOVEL = IV.IDIMOVEL ' +
          '  AND IV.IDVOTOGESTAOIMOVEL =   ' + IDVOTO +
          ' ORDER BY 1';
  result  := ( sSql);
end;

function TCtrlGestInvestImovel.getListaImoveisUnidadeDoMestre( IDVOTO: string): String;
var sSql:String;
begin
  sSql:=  ' SELECT IM.IMONOME, IM.IDIMOVEL ' +
          ' FROM IMOVEL IM                 ' +
          ' WHERE IM.FLGTIPOIMOVEL = 1     ' +
          '  AND IM.IDIMOVELMESTRE =       ' + IDVOTO +
          ' ORDER BY 1';
  result  := sSql;
end;

end.
