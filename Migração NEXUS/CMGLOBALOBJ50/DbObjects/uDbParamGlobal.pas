// Alterações:
{
Pendencia : 24190
Descrição : Criação de parâmetro CriticaGrupo
Data      : 30.03.2007
{ --------------------------------------------------------------------------------------------------
Pendencia : 18778
Descrição : Criar parâmetro FLGORDENASIGLA
Data      : 13/09/2005
Descrição : Este campo define se a ordenação da listagem de moedas será ordenado pelo campo "sigla".
}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 06/09/2004
Pendencia : 17193
Descrição : Criar parâmetro FLGSEGREGAFINANC

Data      : 18/10/2004
Descrição : Retirar parâmetro FLGSEGREGAFINANC
            Criar Parâmetros:
              IDPLANOPREVADM    => Plano de operações Administrativas
              FLGSEGREGAORCOMUM => Segrega Plano "COMUM" na origem
              FLGSEGREGAORADM   => Segrega Plano "ADMINISTRATIVO" na origem
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 10/12/2003
Pendencia : 15773
Descrição : Criar parâmetro FLGSEGREGAVIRTUAL
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/12/2003
Pendencia : 14891
Descrição :
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 29/10/2003
Pendencia : 15453
Descrição :
---------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 20/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamGlobal;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamGlobal = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FFlgobridocpessoa: TCmDbField;
    FFlgusaupperpessoa: TCmDbField;
    FCormestre: TCmDbField;
    FMascaracliente: TCmDbField;
    FFlgusaendpessoa: TCmDbField;
    FCorcabecalho: TCmDbField;
    FUsacrespon: TCmDbField;
    FUnidnegoc: TCmDbField;
    FFlgobrigacc: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdpatro: TCmDbField;
    FCaminhocomunica: TCmDbField;
    FMasccentrorespon: TCmDbField;
    FMascunidnegoc: TCmDbField;
    FDocpjuridica: TCmDbField;
    FFlgcentrorespon: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FDocpfisica: TCmDbField;
    FInscEstadual: TCmDbField;
    FInscMunicipal: TCmDbField;
    FMascaracc: TCmDbField;
    FFlgintegramanut: TCmDbField;
    FMoedacorrente: TCmDbField;
    FFlgcriaagencia: TCmDbField;
    FFlgintegraorc: TCmDbField;
    FFlgdupldocpessoa: TCmDbField;
    FUsaabc: TCmDbField;
    FMascaranumagencia: TCmDbField;
    FFlgusamodrespon: TCmDbField;
    FFlgContabPartDob: TCmDbField;
    FFlgSubContaForn: TCmDbField;
    FFlgSubContaClie: TCmDbField;
    FIDPlanCRespon: TCmDbField;
    FIDPlanCentCust: TCmDbField;
    FFlgCgcAgencia: TcmDbField;
    FFlgSegregaVirtual: TCmDbField;
    FFlgSegregaOrComum: TCmDbField;
    FIdPlanoPrevAdm: TCmDbField;
    FFlgSegregaOrAdm: TCmDbField;
    FDtsegregavirtual: TCmDbField;
    FFlgOrdenaSigla: TCmDbField;
    // p:18951
    FFlgobrigaprog: TCmDbField;
    FFlgsegoradmfin: TCmDbField;
    FFlgsegorcomfin: TCmDbField;
    FCriticaGrupo: TCmDbField;

    procedure SetCaminhocomunica(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCorcabecalho(const Value: TCmDbField);
    procedure SetCormestre(const Value: TCmDbField);
    procedure SetDocpfisica(const Value: TCmDbField);
    procedure SetDocpjuridica(const Value: TCmDbField);
    procedure SetFlgcentrorespon(const Value: TCmDbField);
    procedure SetFlgcriaagencia(const Value: TCmDbField);
    procedure SetFlgdupldocpessoa(const Value: TCmDbField);
    procedure SetFlgintegramanut(const Value: TCmDbField);
    procedure SetFlgintegraorc(const Value: TCmDbField);
    procedure SetFlgobridocpessoa(const Value: TCmDbField);
   // p:18951
    procedure SetFlgobrigaprog(const Value: TCmDbField);
    procedure SetFlgobrigacc(const Value: TCmDbField);
    procedure SetFlgusaendpessoa(const Value: TCmDbField);
    procedure SetFlgusaupperpessoa(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetMascaracc(const Value: TCmDbField);
    procedure SetMascaracliente(const Value: TCmDbField);
    procedure SetMascaranumagencia(const Value: TCmDbField);
    procedure SetMasccentrorespon(const Value: TCmDbField);
    procedure SetMascunidnegoc(const Value: TCmDbField);
    procedure SetMoedacorrente(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetUsaabc(const Value: TCmDbField);
    procedure SetUsacrespon(const Value: TCmDbField);
    procedure SetFlgusamodrespon(const Value: TCmDbField);
    procedure SetFlgContabPartDob(const Value: TCmDbField);
    procedure SetInscEstadual(const Value: TCmDbField);
    procedure SetInscMunicipal(const Value: TCmDbField);
    procedure SetFlgSubContaClie(const Value: TCmDbField);
    procedure SetFlgSubContaForn(const Value: TCmDbField);
    procedure SetIDPlanCentCust(const Value: TCmDbField);
    procedure SetIDPlanCRespon(const Value: TCmDbField);
    procedure SetFlgCgcAgencia(const Value: TcmDbField);
    procedure SetFlgSegregaVirtual(const Value: TCmDbField);
    procedure SetFlgSegregaOrAdm(const Value: TCmDbField);
    procedure SetFlgSegregaOrComum(const Value: TCmDbField);
    procedure SetIdPlanoPrevAdm(const Value: TCmDbField);
    procedure SetDtsegregavirtual(const Value: TCmDbField);
    procedure SetFlgOrdenaSigla(const Value: TCmDbField);
    procedure SetFlgsegoradmfin(const Value: TCmDbField);
    procedure SetFlgsegorcomfin(const Value: TCmDbField);
    procedure SetCriticaGrupo(const Value: TCmDbField);

  public
    Property Usacrespon: TCmDbField read FUsacrespon write SetUsacrespon;
    Property Usaabc: TCmDbField read FUsaabc write SetUsaabc;
    Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
    Property Moedacorrente: TCmDbField read FMoedacorrente write SetMoedacorrente;
    Property Mascunidnegoc: TCmDbField read FMascunidnegoc write SetMascunidnegoc;
    Property Masccentrorespon: TCmDbField read FMasccentrorespon write SetMasccentrorespon;
    Property Mascaranumagencia: TCmDbField read FMascaranumagencia write SetMascaranumagencia;
    Property Mascaracliente: TCmDbField read FMascaracliente write SetMascaracliente;
    Property Mascaracc: TCmDbField read FMascaracc write SetMascaracc;
    Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
    Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

    // pendência 15453 - 29/10/2003
    Property IDPlanCRespon: TCmDbField read FIDPlanCRespon write SetIDPlanCRespon;
    Property IDPlanCentCust: TCmDbField read FIDPlanCentCust write SetIDPlanCentCust;
    // FIM  pendência 15453 - 29/10/2003

    Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
    Property Flgusaupperpessoa: TCmDbField read FFlgusaupperpessoa write SetFlgusaupperpessoa;
    Property Flgusaendpessoa: TCmDbField read FFlgusaendpessoa write SetFlgusaendpessoa;
    Property Flgobrigacc: TCmDbField read FFlgobrigacc write SetFlgobrigacc;
    // p:18951
    Property Flgobrigaprog: TCmDbField read FFlgobrigaprog write SetFlgobrigaprog;
    Property Flgobridocpessoa: TCmDbField read FFlgobridocpessoa write SetFlgobridocpessoa;
    Property Flgintegraorc: TCmDbField read FFlgintegraorc write SetFlgintegraorc;
    Property Flgintegramanut: TCmDbField read FFlgintegramanut write SetFlgintegramanut;
    Property Flgdupldocpessoa: TCmDbField read FFlgdupldocpessoa write SetFlgdupldocpessoa;
    Property Flgcriaagencia: TCmDbField read FFlgcriaagencia write SetFlgcriaagencia;
    Property Flgcentrorespon: TCmDbField read FFlgcentrorespon write SetFlgcentrorespon;
    Property Flgusamodrespon: TCmDbField read FFlgusamodrespon write SetFlgusamodrespon;
    Property Docpjuridica: TCmDbField read FDocpjuridica write SetDocpjuridica;
    Property Docpfisica: TCmDbField read FDocpfisica write SetDocpfisica;
    Property Cormestre: TCmDbField read FCormestre write SetCormestre;
    Property Corcabecalho: TCmDbField read FCorcabecalho write SetCorcabecalho;
    Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
    Property Caminhocomunica: TCmDbField read FCaminhocomunica write SetCaminhocomunica;
    Property FlgContabPartDob: TCmDbField read FFlgContabPartDob write SetFlgContabPartDob;
    Property InscEstadual: TCmDbField read FInscEstadual write SetInscEstadual;
    Property InscMunicipal: TCmDbField read FInscMunicipal write SetInscMunicipal;
    Property FlgSubContaForn: TCmDbField read FFlgSubContaForn write SetFlgSubContaForn;
    Property FlgSubContaClie: TCmDbField read FFlgSubContaClie write SetFlgSubContaClie;
// início  01/12/2003 - pendência 14891
    Property FlgCgcAgencia: TcmDbField read FFlgCgcAgencia write SetFlgCgcAgencia;
// fim  01/12/2003 -  pendência 14891
    //  10/12/2003 - Pendência 15773
    Property FlgSegregaVirtual: TCmDbField read FFlgSegregaVirtual write SetFlgSegregaVirtual;
    Property IdPlanoPrevAdm: TCmDbField read FIdPlanoPrevAdm write SetIdPlanoPrevAdm;
    Property FlgSegregaOrComum: TCmDbField read FFlgSegregaOrComum write SetFlgSegregaOrComum;
    Property FlgSegregaOrAdm: TCmDbField read FFlgSegregaOrAdm write SetFlgSegregaOrAdm;
    //   - início - p: 18474 - 13/01/2005
    Property Dtsegregavirtual: TCmDbField read FDtsegregavirtual write SetDtsegregavirtual;
    //   - início - p: 18474 - 13/01/2005

    Property FlgOrdenaSigla: TCmDbField read FFlgOrdenaSigla write SetFlgOrdenaSigla; // Pendencia 18778

    // - Pendência 23894 - 12/01/07
    property Flgsegorcomfin : TCmDbField read FFlgsegorcomfin write SetFlgsegorcomfin;
    property Flgsegoradmfin : TCmDbField read FFlgsegoradmfin write SetFlgsegoradmfin;

    // 30.03.2007 24190 - flag que indica a ativação da crítica de grupo de acesso
    property CriticaGrupo: TCmDbField read FCriticaGrupo write SetCriticaGrupo;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbParamGlobal }

constructor TDbParamGlobal.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMGLOBAL';

  fIdpessoa          := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Id Pessoa');

  //  - pendência 15453 - 29/10/2003
  fIDPlanCRespon     := CreateCmDbField('IDPLANCRESPON',ftfloat,False,False,False,True,'ID Plano Cent Respon');
  fIDPlanCentCust    := CreateCmDbField('IDPLANCENTCUST',ftfloat,False,False,False,True,'ID Plano Cent Cust');
  // FIM  pendência 15453 - 29/10/2003

  fUsacrespon        := CreateCmDbField('USACRESPON',ftString,True,False,False,True,'Usa CRespon.');
  fUsaabc            := CreateCmDbField('USAABC',ftString,True,False,False,True,'Usa ABC');
  fUnidnegoc         := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'Unidade de Negócio');
  fMoedacorrente     := CreateCmDbField('MOEDACORRENTE',ftfloat,False,False,False,True,'Moeda Corrente');
  fMascaracc         := CreateCmDbField('MASCARACC',ftString,False,False,False,True,'Mascara C/C');
  fMascunidnegoc     := CreateCmDbField('MASCUNIDNEGOC',ftString,False,False,False,True,'Mascara Unidade Negócio');
  fMasccentrorespon  := CreateCmDbField('MASCCENTRORESPON',ftString,False,False,False,True,'Mascara Centro Respon.');
  fMascaranumagencia := CreateCmDbField('MASCARANUMAGENCIA',ftString,False,False,False,True,'Mascara Num. Agencia');
  fMascaracliente    := CreateCmDbField('MASCARACLIENTE',ftString,False,False,False,True,'Mascara Cliente');
  fIdplanoprev       := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'Id Plano Previdência');
  fIdpatro           := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'Id Patro');
  fFlgusaupperpessoa := CreateCmDbField('FLGUSAUPPERPESSOA',ftString,False,False,False,True,'Usa Upper Pessoa');
  fFlgusamodrespon   := CreateCmDbField('FLGUSAMODRESPON',ftString,False,False,False,True,'Usa Mod. Responsabilidade');
  fFlgusaendpessoa   := CreateCmDbField('FLGUSAENDPESSOA',ftString,False,False,False,True,'Usa End. Pessoa');
  fFlgobrigacc       := CreateCmDbField('FLGOBRIGACC',ftString,False,False,False,True,'Obriga CC');
  // p:18951
  fFlgobrigacc       := CreateCmDbField('FLGOBRIGAPROG',ftString,False,False,False,True,'Obriga CC');
  fFlgobridocpessoa  := CreateCmDbField('FLGOBRIDOCPESSOA',ftString,False,False,False,True,'Obriga Doc. Pessoa');
  fFlgintegraorc     := CreateCmDbField('FLGINTEGRAORC',ftString,False,False,False,True,'Integra Orcamento');
  fFlgintegramanut   := CreateCmDbField('FLGINTEGRAMANUT',ftString,False,False,False,True,'Integra Manut.');
  fFlgdupldocpessoa  := CreateCmDbField('FLGDUPLDOCPESSOA',ftString,False,False,False,True,'Duplica Doc. Pessoa');
  fFlgcriaagencia    := CreateCmDbField('FLGCRIAAGENCIA',ftString,False,False,False,True,'Cria Agencia');
  fFlgcentrorespon   := CreateCmDbField('FLGCENTRORESPON',ftString,False,False,False,True,'Centro de Responsabilidade');
  fDocpjuridica      := CreateCmDbField('DOCPJURIDICA',ftfloat,False,False,False,True,'Documento Pessoa Jurídica');
  fDocpfisica        := CreateCmDbField('DOCPFISICA',ftfloat,False,False,False,True,'Documento Pessoa Física');
  fCormestre         := CreateCmDbField('CORMESTRE',ftString,False,False,False,True,'Cor do Mestre');
  fCorcabecalho      := CreateCmDbField('CORCABECALHO',ftString,False,False,False,True,'Cor do Cabecalho');
  fCodcentrorespon   := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'Centro de responsabilidade');
  fCaminhocomunica   := CreateCmDbField('CAMINHOCOMUNICA',ftString,False,False,False,True,'Caminho Comunica');
  FFlgContabPartDob  := CreateCmDbField('FLGCONTABPARTDOB',ftString,False,False,False,True,'Partida Dobrada na Contabilidade');
  fInscEstadual      := CreateCmDbField('INSCESTADUAL',ftfloat,False,False,False,True,'Inscrição Estadual');
  fInscMunicipal     := CreateCmDbField('INSCMUNICIPAL',ftfloat,False,False,False,True,'Inscrição Municipal');
  fFlgSubContaForn   := CreateCmDbField('FLGSUBCONTAFORN',ftString,False,False,False,True,'Cria Sub-Conta Autom. no Cad. Fornecedor');
  fFlgSubContaClie   := CreateCmDbField('FLGSUBCONTACLIE',ftString,False,False,False,True,'Cria Sub-Conta Autom. no Cad. Cliente');

// início  - 01/12/2003 - pendência 14891
  fFlgCgcAgencia    :=  CreateCmDbField('FLGCGCAGENCIA',ftString,False,False,False,True,'Obriga CGC de Agência Bancária');
// fim  - 01/12/2003 - pendência 14891
  // - 10/12/03 - Pend 15773
  FFlgSegregaVirtual :=  CreateCmDbField('FLGSEGREGAVIRTUAL',ftString,False,False,False,True,'Segregação Virtual');
  // 06/09/2004 - 17193
  FIdPlanoPrevAdm :=  CreateCmDbField('IDPLANOPREVADM',ftFloat,False,False,False,True,'Plano de Operações Administrativas');
  FFlgSegregaOrComum :=  CreateCmDbField('FLGSEGREGAORCOMUM',ftString,False,False,False,True,'Segregação na origem do Plano Comum');
  FFlgSegregaOrAdm   :=  CreateCmDbField('FLGSEGREGAORADM',ftString,False,False,False,True,'Segregação na origem do Plano Administrativo');
  //  - início - p: 18474 - 13/01/2005
  FDtsegregavirtual :=  CreateCmDbField('DTSEGREGAVIRTUAL',ftDateTime,False,False,False,True,'Data da segregação virtual');
  //  - fim - p: 18474 - 13/01/2005

  // Pendencia 18778
  FFlgOrdenaSigla := CreateCmDbField('FLGORDENASIGLA',ftFloat,False,False,False,False,'Ordena a moeda pela sigla');

  // - Pendência 23894 - 12/01/07
  FFlgsegorcomfin := CreateCmDbField('FLGSEGORCOMFIN',ftString,False,False,False,True,'Segregação na origem do Plano Comum (apenas o financeiro)');
  FFlgsegoradmfin := CreateCmDbField('FLGSEGORADMFIN',ftString,False,False,False,True,'Segregação na origem do Plano Administrativo (apenas o financeiro)');

  //30.03.2007 24190
  FCriticaGrupo := CreateCmDbField('CRITICAGRUPO',ftString,False,False,False,True,'Ativa critica no grupo de acesso');

end;

function TDbParamGlobal.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbParamGlobal.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbParamGlobal.SetCaminhocomunica(const Value: TCmDbField);
begin
  FCaminhocomunica := Value;
end;

procedure TDbParamGlobal.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbParamGlobal.SetCorcabecalho(const Value: TCmDbField);
begin
  FCorcabecalho := Value;
end;

procedure TDbParamGlobal.SetCormestre(const Value: TCmDbField);
begin
  FCormestre := Value;
end;

procedure TDbParamGlobal.SetDocpfisica(const Value: TCmDbField);
begin
  FDocpfisica := Value;
end;

procedure TDbParamGlobal.SetDocpjuridica(const Value: TCmDbField);
begin
  FDocpjuridica := Value;
end;

procedure TDbParamGlobal.SetDtsegregavirtual(const Value: TCmDbField);
begin
  FDtsegregavirtual := Value;
end;

procedure TDbParamGlobal.SetFlgcentrorespon(const Value: TCmDbField);
begin
  FFlgcentrorespon := Value;
end;

procedure TDbParamGlobal.SetFlgCgcAgencia(const Value: TcmDbField);
begin
  FFlgCgcAgencia := Value;
end;

procedure TDbParamGlobal.SetFlgContabPartDob(const Value: TCmDbField);
begin
  FFlgContabPartDob := Value;
end;

procedure TDbParamGlobal.SetFlgcriaagencia(const Value: TCmDbField);
begin
  FFlgcriaagencia := Value;
end;

procedure TDbParamGlobal.SetFlgdupldocpessoa(const Value: TCmDbField);
begin
  FFlgdupldocpessoa := Value;
end;

procedure TDbParamGlobal.SetFlgintegramanut(const Value: TCmDbField);
begin
  FFlgintegramanut := Value;
end;

procedure TDbParamGlobal.SetFlgintegraorc(const Value: TCmDbField);
begin
  FFlgintegraorc := Value;
end;

procedure TDbParamGlobal.SetFlgobridocpessoa(const Value: TCmDbField);
begin
  FFlgobridocpessoa := Value;
end;

// p:18951
procedure TDbParamGlobal.SetFlgobrigaprog(const Value: TCmDbField);
begin
  FFlgobrigaprog := Value;
end;

procedure TDbParamGlobal.SetFlgobrigacc(const Value: TCmDbField);
begin
  FFlgobrigacc := Value;
end;

procedure TDbParamGlobal.SetFlgOrdenaSigla(const Value: TCmDbField);
begin
  FFlgOrdenaSigla := Value;
end;

procedure TDbParamGlobal.SetFlgSegregaOrAdm(const Value: TCmDbField);
begin
  FFlgSegregaOrAdm := Value;
end;

procedure TDbParamGlobal.SetFlgSegregaOrComum(const Value: TCmDbField);
begin
  FFlgSegregaOrComum := Value;
end;

procedure TDbParamGlobal.SetFlgSegregaVirtual(const Value: TCmDbField);
begin
  FFlgSegregaVirtual := Value;
end;

procedure TDbParamGlobal.SetFlgSubContaClie(const Value: TCmDbField);
begin
  FFlgSubContaClie := Value;
end;

procedure TDbParamGlobal.SetFlgSubContaForn(const Value: TCmDbField);
begin
  FFlgSubContaForn := Value;
end;

procedure TDbParamGlobal.SetFlgusaendpessoa(const Value: TCmDbField);
begin
  FFlgusaendpessoa := Value;
end;

procedure TDbParamGlobal.SetFlgusamodrespon(const Value: TCmDbField);
begin
  FFlgusamodrespon := Value;
end;

procedure TDbParamGlobal.SetFlgusaupperpessoa(const Value: TCmDbField);
begin
  FFlgusaupperpessoa := Value;
end;

procedure TDbParamGlobal.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbParamGlobal.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbParamGlobal.SetIDPlanCentCust(const Value: TCmDbField);
begin
  FIDPlanCentCust := Value;
end;

procedure TDbParamGlobal.SetIDPlanCRespon(const Value: TCmDbField);
begin
  FIDPlanCRespon := Value;
end;

procedure TDbParamGlobal.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbParamGlobal.SetIdPlanoPrevAdm(const Value: TCmDbField);
begin
  FIdPlanoPrevAdm := Value;
end;

procedure TDbParamGlobal.SetInscEstadual(const Value: TCmDbField);
begin
  FInscEstadual := Value;
end;

procedure TDbParamGlobal.SetInscMunicipal(const Value: TCmDbField);
begin
  FInscMunicipal := Value;
end;

procedure TDbParamGlobal.SetMascaracc(const Value: TCmDbField);
begin
  FMascaracc := Value;
end;

procedure TDbParamGlobal.SetMascaracliente(const Value: TCmDbField);
begin
  FMascaracliente := Value;
end;

procedure TDbParamGlobal.SetMascaranumagencia(const Value: TCmDbField);
begin
  FMascaranumagencia := Value;
end;

procedure TDbParamGlobal.SetMasccentrorespon(const Value: TCmDbField);
begin
  FMasccentrorespon := Value;
end;

procedure TDbParamGlobal.SetMascunidnegoc(const Value: TCmDbField);
begin
  FMascunidnegoc := Value;
end;

procedure TDbParamGlobal.SetMoedacorrente(const Value: TCmDbField);
begin
  FMoedacorrente := Value;
end;

procedure TDbParamGlobal.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbParamGlobal.SetUsaabc(const Value: TCmDbField);
begin
  FUsaabc := Value;
end;

procedure TDbParamGlobal.SetUsacrespon(const Value: TCmDbField);
begin
  FUsacrespon := Value;
end;

procedure TDbParamGlobal.SetFlgsegoradmfin(const Value: TCmDbField);
begin
  FFlgsegoradmfin := Value;
end;

procedure TDbParamGlobal.SetFlgsegorcomfin(const Value: TCmDbField);
begin
  FFlgsegorcomfin := Value;
end;

procedure TDbParamGlobal.SetCriticaGrupo(const Value: TCmDbField);
begin
  FCriticaGrupo := Value;
end;

end.

