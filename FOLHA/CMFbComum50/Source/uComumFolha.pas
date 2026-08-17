unit uComumFolha;

interface

uses wwquery, sysutils, udatabase;


type
  TObjComumFolha = class
  private
    FFLGUSACODRUBEXT           : integer;
    FFlgAgrupaRubrica          : Integer;     

    procedure SetFLGUSACODRUBEXT(const Value: integer);   
    procedure SetFlgAgrupaRubrica(const Value: Integer);        

  protected
  public

    property FlgUsaCodRubExt: integer read FFLGUSACODRUBEXT write SetFLGUSACODRUBEXT;
    property FlgAgrupaRubrica: Integer read FFlgAgrupaRubrica write SetFlgAgrupaRubrica; 

    Constructor Create;

    //MÉTODOS PARA PEGAR VALORES DE BENEFICIO DE UMA PESSOA
    function PegaSRBBeneficio(qryAux: twwquery; smes, sidtitular, sidpessoa: string; var bprov: boolean; var dtInicio, dtFim : string): real;
    function PegaINSSBeneficio(qryAux: twwquery; smes, sidtitular, sidpessoa: string): real;
    function PegaValorIntegralBeneficio(qryAux: twwquery; smes, sidtitular, sidpessoa: string): real;

  end;

var ComumFolha: TObjComumFolha;

implementation

{ TObjComumFolha }

constructor TObjComumFolha.Create;
begin

end;

// PARAMETRO PARA INDICAR SE A FUNDACAO VAI TRABALHAR COM CODIGO
// INTERNO OU EXTERNO DAS RUBRICAS - (MIGRAÇÃO DA UADMPREV)
procedure TObjComumFolha.SetFLGUSACODRUBEXT(const Value: integer);
begin
  FFLGUSACODRUBEXT:= Value;
end;

procedure TObjComumFolha.SetFlgAgrupaRubrica(const Value: Integer);
begin
  FFlgAgrupaRubrica := Value;
end;

function TObjComumFolha.PegaINSSBeneficio(qryAux: twwquery; smes, sidtitular,
  sidpessoa: string): real;
begin
  if FazQuery(qryAux,
       'select h.valorintegral, h.mesreferencia '+
       'from hstbenefbfciario h, benefplanprev b '+
       'where h.mes = '+QuotedStr(smes)+' '+
       'and h.idtitular = '+sidtitular+' '+
       'and h.idpessoa = '+sidpessoa+' '+
       'and b.idbeneficio = h.idbeneficio '+
       'and b.idplanoprev = h.idplanoprev '+
       'and b.flgreferencia = 1 '+
       'and h.flgdevolucao = 0 '+ 
       'order by h.mesreferencia desc') then
    result:=qryAux.fields[0].asfloat
  else
    result:=0;
end;

function TObjComumFolha.PegaSRBBeneficio(qryAux: twwquery; smes, sidtitular,
  sidpessoa: string; var bprov: boolean; var dtInicio, dtFim : string): real;
begin
  if FazQuery(qryAux,
       'select h.valorsrb, h.mesreferencia, h.flgprovisorio, bf.datainicio, bf.datafinal '+
       'from hstbenefbfciario h, benefplanprev b, beneficio b1, benefbfciario bf '+
       'where h.mes = '+QuotedStr(smes)+' '+
       'and h.idtitular = '+sidtitular+' '+
       'and h.idpessoa = '+sidpessoa+' '+
       'and  h.idplanoprev = bf.idplanoprev '+
       'and  h.idbeneficio = bf.idbeneficio '+
       'and  h.numeroprocesso = bf.numeroprocesso '+
       'and  h.idpessjur = bf.idpessjur '+
       'and  h.idtitular = bf.idtitular '+
       'and  h.idpessoa = bf.idpessoa '+
       'and  h.seqproposta = bf.seqproposta '+
       'and  h.idplanoorigem  = bf.idplanoorigem '+
       'and b.idbeneficio = h.idbeneficio '+
       'and b.idplanoprev = h.idplanoprev '+
       'and b1.idbeneficio = b.idbeneficio '+
       'and b1.tipobeneficio < 99 '+
       'and b.flgreferencia = 0 '+
       'and h.flgdevolucao = 0 '+ 
       'order by h.mesreferencia desc') then
  Begin
    If qryAux.FieldByName('flgprovisorio').AsInteger = 1 Then
      bprov := True
    Else
      bprov := False;

    dtInicio := qryAux.FieldByName('datainicio').AsString;
    dtFim    := qryAux.FieldByName('datafinal').AsString;
    result   := qryAux.fields[0].asfloat;
  End
  else
    result := 0;
end;

function TObjComumFolha.PegaValorIntegralBeneficio(qryAux: twwquery;
  smes, sidtitular, sidpessoa: string): real;
begin
  if FazQuery(qryAux,
       'select h.valorintegral, h.mesreferencia '+
       'from hstbenefbfciario h, benefplanprev b, beneficio b1 '+
       'where h.mes = '+QuotedStr(smes)+' '+
       'and h.idtitular = '+sidtitular+' '+
       'and h.idpessoa = '+sidpessoa+' '+
       'and b.idbeneficio = h.idbeneficio '+
       'and b.idplanoprev = h.idplanoprev '+
       'and b1.idbeneficio = b.idbeneficio '+
       'and b1.tipobeneficio < 99 '+
       'and b.flgreferencia = 0 '+
       'and b1.tipobeneficio <> 5 '+
       'and h.flgdevolucao = 0 '+ 
       'order by h.mesreferencia desc') then
    result:=qryAux.fields[0].asfloat
  else
    result:=0;
end;

initialization
  ComumFolha:=TObjComumFolha.Create;
finalization
  ComumFolha.free;

end.

{------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/08/2002 A 07/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do novo parâmetro FlgAgrupaRubrica.                            |
|------------------------------------------------------------------------------|}
