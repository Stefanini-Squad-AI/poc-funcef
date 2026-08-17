{*******************************************************}
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 25/05/2004                             }
{*******************************************************}

{ ------------------------------------------------------------------------------------------------
 Alterações:
-----------------------------------------------------------------------------------------------------
 Responsável: Arnaldo V. Scarin
 Data.......: 11/11/2024
 Atender....: WO15987 - Global - Cadastro de centro de custo
 Descrição..: Inclusão da Hora nos campos Data
-----------------------------------------------------------------------------------------------------
Rotina             : FOrdem, SetOrdem
N. SIG..........   : 60690
Data da Alteração: : 08/02/2018
Alteração Form:    : uDbRespCentCust
Responsável:       : Everson Luiz Pereira da Cunha
Descrição.......   : O sistema deve permitir a inclusão de mais de um substituto sem a data de
                     término de vigência estar preenchida. Criar campo para ordenar os substitutos
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
Autor......: Felipe A. Santos
Data.......: 13/09/2013
Sol........: 195376
Kintana....: 1866485
Descrição..: Criação da Aba Substitutos e inclusão dos campos Matrícula e Portaria no grid
---------------------------------------------------------------------------------------------------}

unit uDbRespCentCust;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRespCentCust = class(TCmDbObject)

  private
    FDtfimvig: TCmDbField;
    FIdempresa: TCmDbField;
    FIdrespcentcust: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FDtiniciovig: TCmDbField;
    FPortaria: TCmDbField;  // Felipe A. Santos SOL 195376 KTN 1866485
    FTipoRespCentCust: TCmDbField; // Felipe A. Santos SOL 195376 KTN 1866485
    FOrdem: TCmDbField; //SIG 60690
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetDtfimvig(const Value: TCmDbField);
    procedure SetDtiniciovig(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdrespcentcust(const Value: TCmDbField);
    procedure SetPortaria(const Value: TCmDbField); // Felipe A. Santos SOL 195376 KTN 1866485
    procedure SetTipoRespCentCust(const Value: TCmDbField); // Felipe A. Santos  SOL 195376 KTN 1866485
    procedure SetOrdem(const Value: TCmDbField); // SIG 60690

  public

     Property Idrespcentcust: TCmDbField read FIdrespcentcust write SetIdrespcentcust;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Dtiniciovig: TCmDbField read FDtiniciovig write SetDtiniciovig;
     Property Dtfimvig: TCmDbField read FDtfimvig write SetDtfimvig;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property Portaria: TCmDbField read FPortaria write SetPortaria; // Felipe A. Santos SOL 195376 KTN 1866485
     Property TipoRespCentCust: TCmDbField read FTipoRespCentCust write SetTipoRespCentCust; // Felipe A. Santos SOL 195376 KTN 1866485
     Property Ordem: TCmDbField read FOrdem write SetOrdem;


     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRespCentCust }

constructor TDbRespCentCust.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RESPCENTCUST';

   fIdrespcentcust := CreateCmDbField('IDRESPCENTCUST',ftfloat,True,True,False,True,'Id.');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'Pessoa');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,False,False,True,'Empresa');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftstring,True,False,False,True,'Centro de Custo');
   // WO15987 - Global - Cadastro de centro de custo
   // Alterado por Arnaldo V. Scarin em 11/11/2024
   // Foi feito o Ajuste para que seja considerado o Time no Campo Data
   fDtiniciovig := CreateCmDbField('DTINICIOVIG',ftDateTime,False,False,False,True,'Início de Vigência',-1,true);
   fDtfimvig := CreateCmDbField('DTFIMVIG',ftDateTime,False,False,False,True,'Fim de Vigência',-1,true);
   // WO15987 - FIM
   fPortaria := CreateCmDbField('PORTARIA', ftstring, False, False, False, True,'Portaria'); // Felipe A. Santos SOL 195376 KTN 1866485
   fTipoRespCentCust := CreateCmDbField('TIPORESPCENTCUST', ftstring, True, True, False, True,'Tipo do Responsável'); // Felipe A. Santos SOL 195376 KTN 1866485
   fOrdem := CreateCmDbField('ORDEM', ftInteger, false, false, false, true, 'Ordem de Substituição');// SIG 60690
end;

function TDbRespCentCust.Insert: Boolean;
begin

   fIdrespcentcust.AsFloat := GetSequence('RESPCENTCUST');
   Result := Inherited Insert;

end;


procedure TDbRespCentCust.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbRespCentCust.SetDtfimvig(const Value: TCmDbField);
begin
  FDtfimvig := Value;
end;

procedure TDbRespCentCust.SetDtiniciovig(const Value: TCmDbField);
begin
  FDtiniciovig := Value;
end;

procedure TDbRespCentCust.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbRespCentCust.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRespCentCust.SetIdrespcentcust(const Value: TCmDbField);
begin
  FIdrespcentcust := Value;
end;

procedure TDbRespCentCust.SetOrdem(const Value: TCmDbField);
begin
  FOrdem := Value;  //SIG 60690
end;

procedure TDbRespCentCust.SetPortaria(const Value: TCmDbField);
begin
  FPortaria := Value;  // Felipe A. Santos  SOL 195376 KTN 1866485
end;

procedure TDbRespCentCust.SetTipoRespCentCust(const Value: TCmDbField);
begin
  FTipoRespCentCust := Value; // Felipe A. Santos  SOL 195376 KTN 1866485
end;

end.



