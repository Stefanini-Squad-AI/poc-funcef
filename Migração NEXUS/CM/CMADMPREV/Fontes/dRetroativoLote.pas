unit dRetroativoLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Wwquery, Db, Wwtable, Wwdatsrc;

type
  TdmRetroativoLote = class(TDataModule)
    dsTxt: TwwDataSource;
    tbParadox: TwwTable;
    bmPatro: TBatchMove;
    tbTxt: TwwTable;
    qryAnalise: TwwQuery;
    qryElegivel: TwwQuery;
    qryRubrica: TwwQuery;
    qryParticipa: TwwQuery;
    tbRubrica: TwwTable;
    tbPessoa: TwwTable;
    qrySalarioLote: TwwQuery;
    qryAux1: TwwQuery;
    qryRetroativo: TwwQuery;
    qryAux2: TwwQuery;
    qryAux3: TwwQuery;
    qryPessoaLote: TwwQuery;
    tbPessoaMatricula: TStringField;
    tbPessoaIdpessjur: TFloatField;
    tbPessoaIdpessoa: TFloatField;
    tbPessoaIdplanoprev: TFloatField;
    tbPessoaIdsalpart: TFloatField;
    tbPessoaIdsalbenef: TFloatField;
    tbRubricaCodprov: TStringField;
    tbRubricaIdrubrica: TFloatField;
    tbRubricaFlgdesconto: TSmallintField;
    tbRubricaFlgsalpart: TSmallintField;
    tbRubricaFlgsalbenef: TSmallintField;
    qryContrib: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRetroativoLote: TdmRetroativoLote; 

implementation

{$R *.DFM}

end.
