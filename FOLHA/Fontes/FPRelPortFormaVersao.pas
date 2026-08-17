{==============================================================================|
| Pendência   : SIG TIBERO                                                     |
| Responsável : Everson Luiz Pereira da Cunha                                  |
| Data        : 22/02/2018                                                     |
| Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.        |
|               Retirada de INDEX, +rule etc.                                  |
|               Melhoria realizada para adaptação ao TIBERO.                   |
|==============================================================================|
| UNIT: dtmRelPortadorVersao                                                   |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   FORMULÁRIO DE FILTRO PARA O RELATORIO DE PORTADOR FORMA POR VERSÃO         |
===============================================================================|
| DESENVOLVEDOR: FERNANDO                                                      |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/03/2002 A 14/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12E                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   CRIAÇÃO DO DA UNIT                                                         |
| DESENVOLVEDOR: FERNANDO                                                      |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/03/2002 A 14/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12E                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   CRIAÇÃO DO DA UNIT                                                         |
|==============================================================================|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/12/2002 A 19/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER) - Pendência 11067.                                          |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Alteração do caption do form.                    |
|   Obs: Foram feitos testes com a base da REFER na CM e não foi detectado     |
|         erro como descrito na Pendência.                                     |
|==============================================================================}


unit FPRelPortFormaVersao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CheckLst, wwdblook, Db, DBTables, Wwquery, dbasedados, usistema;

type
  Tfrmprelportformaversao = class(TfrmOkCancelar)
    grpMesRef: TGroupBox;
    dblcHistorico: TwwDBLookupCombo;
    Label4: TLabel;
    chklstPortforma: TCheckListBox;
    qryHistorico: TwwQuery;
    qryAux: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure dblcHistoricoChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    sPortformaSel : String;
    ListaPortforma: tstringlist;
    procedure MontaListaPortforma;
    procedure DeterminaPortforma;
    Function MontaQuery(Qry: TwwQuery): boolean;
  public
    { Public declarations }
  end;

var
  frmprelportformaversao: Tfrmprelportformaversao;

implementation

uses DRelPortFormaVersao, UFuncoesFolha, Udatabase;

{$R *.DFM}

procedure Tfrmprelportformaversao.FormCreate(Sender: TObject);
begin
  inherited;
  ListaPortforma:=tstringlist.create;
  qryHistorico.Open;
end;

procedure Tfrmprelportformaversao.DeterminaPortforma;
begin
    MontaFiltro(chklstPortforma, ListaPortforma, sPortformaSel);
end;

procedure Tfrmprelportformaversao.MontaListaPortforma;
begin
  chklstPortforma.items.clear;
  ListaPortforma.clear;

  if FazQuery(qryAux, 'SELECT DISTINCT P.CODPORTFORMA, P.DESCRICAO '+
      'FROM HISTRUBSAL H, PORTADORFORMA P '+
      'WHERE (H.IDHSTFOLHABENEF = '+
      inttostr(qryHistorico.FieldByName('IDHSTFOLHABENEF').asinteger)+') '+
      'AND (H.CODPORTFORMA = P.CODPORTFORMA) '+
      'ORDER BY P.DESCRICAO') then
    while not qryAux.eof do
    begin
      chklstPortforma.items.add(qryAux.fieldbyname('DESCRICAO').asstring);
      ListaPortforma.Add(qryAux.fieldbyname('CODPORTFORMA').asstring);
      qryAux.next;
    end;
end;


procedure Tfrmprelportformaversao.dblcHistoricoChange(Sender: TObject);
begin
  inherited;
   MontaListaPortforma;
end;

procedure Tfrmprelportformaversao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if not MontaQuery(dtmRelPortadorVersao.QryPrinc) then Exit;

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

end;

Function Tfrmprelportformaversao.MontaQuery(qry: TwwQuery): Boolean;
 var ssql : string;
begin
  Result := True;

  DeterminaPortforma;

  ssql:= ' select pp.inscricaonumero,dp.NUMSEQUENCIA, '+
         ' h.NUMBANCo, h.NUMAGENCIA, h.CONTACORRENTE, h.CODPORTFORMA,pf.descricao, '+
         ' h.IDHSTFOLHABENEF, h.DATAPAGAMENTO, h.idRESPONSAVEL AS IDPESSOA, h.idplanoprev, h.idpatro, p.nome, '+
         ' NVL(DP.MATRICULA, EL.MATRICULA) AS MATRICULA, '+
//         ' sum(decode(pd.flgespecial,0,decode(pd.flgdesconto,0,VALORPROVENTO,VALORPROVENTO * -1),0)) as valor '+   //Everson TIBERO
         ' sum(decode(pd.flgespecial,0,decode(pd.flgdesconto,0,h.VALORPROVENTO,h.VALORPROVENTO * -1),0)) as valor '+ //Everson TIBERO
         ' from histrubsal h, pessoa p, partprevplan pp, depentit dp, provdesc pd, portadorforma pf, ELEGPATRO EL '+
         ' where p.idpessoa = h.idresponsavel and h.idtitular = pp.idpessoa and h.idplanoprev = pp.idplanoprev '+
         ' and h.idpatro = pp.idpessjur and h.idresponsavel = dp.idpessoa(+) and h.idtitular = dp.idtitular(+) and h.idrubrica = pd.idprovento '+
         ' AND (H.FLGESTORNO = 0 OR H.FLGESTORNO IS NULL) '+
//         ' and IDHSTFOLHABENEF = '+ //Everson TIBERO
         ' and h.IDHSTFOLHABENEF = '+ //Everson TIBERO
         inttostr(qryHistorico.FieldByName('IDHSTFOLHABENEF').asinteger)+' ';

  if sPortformaSel <> '' then
  begin
    if pos(',', sPortformaSel) = 0 then
      ssql:=ssql+' AND H.CODPORTFORMA = '+sPortformaSel+' '
    else
      ssql:=ssql+' AND H.CODPORTFORMA in ('+sPortformaSel+') ';
  end;
  ssql := ssql + ' and h.CODPORTFORMA = pf.CODPORTFORMA '+
                 ' AND H.IDTITULAR = EL.IDPESSOA '+
                 ' AND H.IDPATRO   = EL.IDPESSJUR '+
                 ' group by h.DATAPAGAMENTO, h.CODPORTFORMA, p.nome , pp.inscricaonumero, h.NUMBANCO, '+
                 ' h.NUMAGENCIA, h.CONTACORRENTE, pf.descricao, h.IDHSTFOLHABENEF, '+
                 ' dp.NUMSEQUENCIA, h.idRESPONSAVEL, h.idplanoprev, h.idpatro, DP.MATRICULA, EL.MATRICULA '+
                 ' order by h.DATAPAGAMENTO, h.CODPORTFORMA, h.IDHSTFOLHABENEF, p.nome ';

  with dtmRelPortadorVersao do
  begin
       qryprinc.close;
       qryPrinc.Sql.Clear;
       qryprinc.Sql.Add(ssql);
  end;

end;

end.



