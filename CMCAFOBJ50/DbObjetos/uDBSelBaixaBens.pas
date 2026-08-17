{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 21/09/2005                             }
{                                                       }
{*******************************************************}

unit uDBSelBaixaBens;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBSelBaixaBens = class(TCmDbObject)

  private
    FIdgrupatual: TCmDbField;
    FIdlocalatual: TCmDbField;
    FIdgrupo: TCmDbField;
    FIdresponsavel: TCmDbField;
    FIdselbaixa: TCmDbField;
    FIdbem: TCmDbField;
    FIdconjunto: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdlocalizacao: TCmDbField;
    FSbbvalvenda: TCmDbField;
    FIdrespatual: TCmDbField;
    FIdconjatual: TCmDbField;
    FFlgExecutado: TCmDbField;
    FVidaUtil: TCmDbField;
    FTipDepProRata: TCmDbField;
    FValorLaudo: TCmDbField;
    FObsReaval: TCmDbField;
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdconjatual(const Value: TCmDbField);
    procedure SetIdconjunto(const Value: TCmDbField);
    procedure SetIdgrupatual(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdlocalatual(const Value: TCmDbField);
    procedure SetIdlocalizacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdrespatual(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);
    procedure SetIdselbaixa(const Value: TCmDbField);
    procedure SetSbbvalvenda(const Value: TCmDbField);
    procedure SetFlgExecutado(const Value: TCmDbField);
    procedure SetObsReaval(const Value: TCmDbField);
    procedure SetTipDepProRata(const Value: TCmDbField);
    procedure SetValorLaudo(const Value: TCmDbField);
    procedure SetVidaUtil(const Value: TCmDbField);

  public

     Property Sbbvalvenda: TCmDbField read FSbbvalvenda write SetSbbvalvenda;
     Property Idselbaixa: TCmDbField read FIdselbaixa write SetIdselbaixa;
     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Idrespatual: TCmDbField read FIdrespatual write SetIdrespatual;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idlocalizacao: TCmDbField read FIdlocalizacao write SetIdlocalizacao;
     Property Idlocalatual: TCmDbField read FIdlocalatual write SetIdlocalatual;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idgrupatual: TCmDbField read FIdgrupatual write SetIdgrupatual;
     Property Idconjunto: TCmDbField read FIdconjunto write SetIdconjunto;
     Property Idconjatual: TCmDbField read FIdconjatual write SetIdconjatual;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property FlgExecutado: TCmDbField read FFlgExecutado write SetFlgExecutado;
     Property VidaUtil      : TCmDbField read FVidaUtil write SetVidaUtil;
     Property ValorLaudo    : TCmDbField read FValorLaudo write SetValorLaudo;
     Property TipDepProRata : TCmDbField read FTipDepProRata write SetTipDepProRata;
     Property ObsReaval     : TCmDbField read FObsReaval write SetObsReaval;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBSelBaixaBens }

constructor TDBSelBaixaBens.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;
   TableName := 'SELBAIXABENS';

   fIdselbaixa := CreateCmDbField('IDSELBAIXA',ftfloat,True,True,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,False,False,False,True,'');
   fIdrespatual := CreateCmDbField('IDRESPATUAL',ftfloat,False,False,False,True,'');
   fIdlocalizacao := CreateCmDbField('IDLOCALIZACAO',ftfloat,False,False,False,True,'');
   fIdlocalatual := CreateCmDbField('IDLOCALATUAL',ftfloat,False,False,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,False,False,False,True,'');
   fIdgrupatual := CreateCmDbField('IDGRUPATUAL',ftfloat,False,False,False,True,'');
   fIdconjunto := CreateCmDbField('IDCONJUNTO',ftfloat,False,False,False,True,'');
   fIdconjatual := CreateCmDbField('IDCONJATUAL',ftfloat,False,False,False,True,'');
   fSbbvalvenda := CreateCmDbField('SBBVALVENDA',ftfloat,False,False,False,False,'');
   fVidaUtil := CreateCmDbField('VIDAUTIL',ftInteger,False,False,False,False,'');
   fValorLaudo := CreateCmDbField('VALORLAUDO',ftfloat,False,False,False,False,'');
   fTipDepProRata := CreateCmDbField('TIPDEPPRORATA',ftInteger,False,False,False,False,'');
   fObsReaval := CreateCmDbField('OBSREAVAL',ftString,False,False,False,False,'');
   fFlgExecutado := CreateCmDbField('FLGEXECUTADO',ftfloat,False,False,False,False,'');
end;

function TDBSelBaixaBens.Insert: Boolean;
begin
   if not ((FFlgExecutado.AsInteger = 0) or (FFlgExecutado.AsInteger = 1)) then
      FFlgExecutado.AsInteger := 0;
   Result := Inherited Insert;
end;

procedure TDBSelBaixaBens.SetFlgExecutado(const Value: TCmDbField);
begin
  FFlgExecutado := Value;
end;

procedure TDBSelBaixaBens.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBSelBaixaBens.SetIdconjatual(const Value: TCmDbField);
begin
  FIdconjatual := Value;
end;

procedure TDBSelBaixaBens.SetIdconjunto(const Value: TCmDbField);
begin
  FIdconjunto := Value;
end;

procedure TDBSelBaixaBens.SetIdgrupatual(const Value: TCmDbField);
begin
  FIdgrupatual := Value;
end;

procedure TDBSelBaixaBens.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDBSelBaixaBens.SetIdlocalatual(const Value: TCmDbField);
begin
  FIdlocalatual := Value;
end;

procedure TDBSelBaixaBens.SetIdlocalizacao(const Value: TCmDbField);
begin
  FIdlocalizacao := Value;
end;

procedure TDBSelBaixaBens.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBSelBaixaBens.SetIdrespatual(const Value: TCmDbField);
begin
  FIdrespatual := Value;
end;

procedure TDBSelBaixaBens.SetIdresponsavel(const Value: TCmDbField);
begin
  FIdresponsavel := Value;
end;

procedure TDBSelBaixaBens.SetIdselbaixa(const Value: TCmDbField);
begin
  FIdselbaixa := Value;
end;

procedure TDBSelBaixaBens.SetObsReaval(const Value: TCmDbField);
begin
  FObsReaval := Value;
end;

procedure TDBSelBaixaBens.SetSbbvalvenda(const Value: TCmDbField);
begin
  FSbbvalvenda := Value;
end;

procedure TDBSelBaixaBens.SetTipDepProRata(const Value: TCmDbField);
begin
  FTipDepProRata := Value;
end;

procedure TDBSelBaixaBens.SetValorLaudo(const Value: TCmDbField);
begin
  FValorLaudo := Value;
end;

procedure TDBSelBaixaBens.SetVidaUtil(const Value: TCmDbField);
begin
  FVidaUtil := Value;
end;

end.

