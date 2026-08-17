// Alterações:
{-------------------------------------------------------------------------------
Analista.: Edilaine
SOL......: 196824
Kintana..: 1884092
Data.....: 13/12/2012
Rotina...: RetornaConsultaPrincipal
Descrição: distinct para nao retornar IDINFORMES duplicados
{-------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 180963
Kintana..: 1683452
Data.....: 01/06/2012
Rotina...: RetornaConsultaPrincipal
Descrição: feito left outer join com ano vigencia para que
{-------------------------------------------------------------------------------
Analista.: Vinicius Eduardo Nascimento Maciel
SOL......: 168331
Kintana..: 1482898
Data.....: 19/01/2012
Rotina...: RetornaConsultaPrincipal
Descrição: Foi adicionado o filtro por ano Vigência na query para que as
           alterações na tabela informe tenham sentido.
-------------------------------------------------------------------------------}
unit uCtrlConsultaBusca;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     classes, Forms, uCMMath,
     dbtables, mconnect, ucmFileUtils,
     uCmCustomCdbObject, ADODb, provider, {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
     uCripto, wwQuery, dBasedados;

  Type
    TCtrlConsultaBusca = Class(TCmControlObject)
    private
    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize; Override;
      function RetornaConsultaPrincipal(const sAnoBusca, sCPF: String): String;
    public
      Constructor Create; Override;

      Destructor Destroy; Override;
      function ListConsultaBusca(const sAnoBusca, sCPF : String) : OleVariant;
      function MontaFiltroIdPessoa(const sAnoBusca, sCPF: String): OleVariant;
      Function MontaFiltroIdFolha(const sAnoBusca, sCPF: String): OleVariant;
      Function MontaFiltroMes(const sAnoBusca, sCPF: String): OleVariant;
      Function MontaFiltroIdInforme(const sAnoBusca,sCPF: String): OleVariant;
      function BuscaNome(const sCPF: String): OleVariant;
    End;


implementation

{ TCtrlConsultaBusca }

procedure TCtrlConsultaBusca.AfterInitialize;
begin
  inherited;
end;

constructor TCtrlConsultaBusca.Create;
begin
  inherited;
end;

destructor TCtrlConsultaBusca.Destroy;
begin
  inherited;
end;

procedure TCtrlConsultaBusca.DoChangeDataBase;
begin
  inherited;
end;

Function TCtrlConsultaBusca.RetornaConsultaPrincipal(const sAnoBusca : string;const sCPF : String) : String;
begin
  Result := 'Select l.iddarf,' + #13#10 +
            '       l.idlancirrf,' + #13#10 +
            '       pe.numdocumento,' + #13#10 +
            '       l.idbenefirrf,' + #13#10 +
            '       l.idhstfolhabenef,' + #13#10 +
            '       l.idprocjud,' + #13#10 +
            '       l.codnatureza,' + #13#10 +
            '       lx.idinforme,' + #13#10 +
            '       i.nomeinforme,' + #13#10 +
            '       i.coddirf,' + #13#10 +
            '       i.codinforme,' + #13#10 +
            '       round(lx.vlrlanc,2) as vlrlanc,' + #13#10 +
            '       lx.flgtiporeg,'+#13#10 +
            '       l.flgpensaoalim,' + #13#10 +
            '       l.datapagamento,' + #13#10 +
            '       lx.fontepagadora,' + #13#10 +
            '       l.trgdtinclusao' + #13#10 +
            '  from lancirrf l, lancxinforme lx, /*informe i,*/ pessoa pe' + #13#10 +                                                        // Edilaine - SOL 196824 / KTN 1884092 - tabela comentada
            '  , (SELECT DISTINCT IDINFORME, anovigencia,FLGIRRF, FLGBASE, CODDIRF, codinforme, nomeinforme FROM INFORME) I '   + #13#10 +   // Edilaine - SOL 196824 / KTN 1884092
            '  , (SELECT MAX(ANOVIGENCIA) AS ANOVIGENCIA, idinforme FROM informe WHERE ANOVIGENCIA <='+sAnoBusca+' group by idinforme) QAX ' + #13#10 +  //Vinicius Maciel SOL 168331 - KTN 1482898
            ' where l.idlancirrf = lx.idlancirrf' + #13#10 +
            '   and lx.idinforme = i.idinforme' + #13#10 +
            '   and l.idbenefirrf = pe.idpessoa' + #13#10 +
            '   and l.idbenefirrf in (Select idpessoa from pessoa' + #13#10 +
            '                         where numdocumento = '+QuotedStr(sCPF)+')' + #13#10 +
            '   and to_char(l.datapagamento, ''yyyy'') = ' + QuotedStr(sAnoBusca) + #13#10 +
            //Vinicius Maciel  SOL 168331 - KTN 1482898
            '   and i.idinforme = qax.idinforme(+)  '+ #13#10 +      // Edilanie - SOL 180963 / KTN 1683452
            '   and i.anovigencia = qax.anovigencia(+) '+ #13#10 +   // Edilanie - SOL 180963 / KTN 1683452
            //Vinicius Maciel SOL 168331 - KTN 1482898  - FIM
            ' order by idhstfolhabenef,idbenefirrf,idinforme';
end;

Function TCtrlConsultaBusca.BuscaNome(const sCPF : String): OleVariant;
var sSql : String;
begin
  sSql := 'Select P.Nome,Pe.DataNasc from Pessoa P,PessoaFisica PE Where p.Idpessoa = pe.idpessoa and p.Numdocumento = '+quotedStr(sCPF);
  Result := GetDataPacket(sSql);
end;

function TCtrlConsultaBusca.ListConsultaBusca(const sAnoBusca,sCPF : String): OleVariant;
var sSql : String;
begin
  sSql := RetornaConsultaPrincipal(sAnoBusca,sCPF);
  Result := GetDataPacket(sSql);
end;

Function TCtrlConsultaBusca.MontaFiltroIdPessoa(const sAnoBusca,sCPF : String) : OleVariant;
var sSql : String;
begin
  sSql := 'Select Distinct Idbenefirrf From ('+RetornaConsultaPrincipal(sAnoBusca,sCPF)+') ORDER BY 1';
  Result := GetDataPacket(sSql);
end;

function TCtrlConsultaBusca.MontaFiltroIdFolha(const sAnoBusca,sCPF: String): OleVariant;
var sSql : String;
begin
  sSql := 'Select Distinct IdHstFolhaBenef From ('+RetornaConsultaPrincipal(sAnoBusca,sCPF)+') ORDER BY 1';
  Result := GetDataPacket(sSql);
end;

function TCtrlConsultaBusca.MontaFiltroMes(const sAnoBusca,sCPF: String): OleVariant;
var sSql : String;
begin
  sSql := 'Select Distinct DataPagamento From ('+RetornaConsultaPrincipal(sAnoBusca,sCPF)+') ORDER BY 1';
  Result := GetDataPacket(sSql);
end;

Function TCtrlConsultaBusca.MontaFiltroIdInforme(const sAnoBusca,sCPF : String) : OleVariant;
var sSql : String;
begin
  sSql := 'Select Distinct IdInforme From ('+RetornaConsultaPrincipal(sAnoBusca,sCPF)+') ORDER BY 1';
  Result := GetDataPacket(sSql);
end;


end.

