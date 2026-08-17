{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 26/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamCompras;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbParamCompras = class(TCmDbObject)

  private
    FAssinatura3: TCmDbField;
    FAssinatura2: TCmDbField;
    FModeloImpOC: TCmDbField;
    FNumavAliacoes: TCmDbField;
    FCodTipDoc: TCmDbField;
    FFlgObsSCIOC: TCmDbField;
    FTrasObs: TCmDbField;
    FPesoPreco: TCmDbField;
    FInstrucaoOC: TCmDbField;
    FPesoAvaliacao: TCmDbField;
    FImpLogo: TCmDbField;
    FPesoPrazoEnt: TCmDbField;
    FAssinatura1: TCmDbField;
    FCabecColeta: TCmDbField;
    FFlgVerifRAD: TCmDbField;
    FIdPessoa: TCmDbField;
    FPesoPrazoPgto: TCmDbField;
    FComprarAlemSC: TCmDbField;
    FRodapeColeta: TCmDbField;
    FFlgOrcamento: TCmDbField;
    FTxJuros: TCmDbField;
    FImpObsAparte: TCmDbField;
    FOpdestino: TCmDbField;

    FFlgMargemOC: TCmDbField;
    FCodCentRespon: TCmDbField;
    FFlgDataEmissao: TCmDbField;
    FFlgAcessLancDoc: TCmDbField;

    procedure SetAssinatura1(const Value: TCmDbField);
    procedure SetAssinatura2(const Value: TCmDbField);
    procedure SetAssinatura3(const Value: TCmDbField);
    procedure SetCabecColeta(const Value: TCmDbField);
    procedure SetCodTipDoc(const Value: TCmDbField);
    procedure SetComprarAlemSC(const Value: TCmDbField);
    procedure SetFlgObsSCIOC(const Value: TCmDbField);
    procedure SetFlgOrcamento(const Value: TCmDbField);
    procedure SetFlgVerifRAD(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetImpLogo(const Value: TCmDbField);
    procedure SetImpObsAparte(const Value: TCmDbField);
    procedure SetInstrucaoOC(const Value: TCmDbField);
    procedure SetModeloImpOC(const Value: TCmDbField);
    procedure SetNumavAliacoes(const Value: TCmDbField);
    procedure SetPesoAvaliacao(const Value: TCmDbField);
    procedure SetPesoPrazoEnt(const Value: TCmDbField);
    procedure SetPesoPrazoPgto(const Value: TCmDbField);
    procedure SetPesoPreco(const Value: TCmDbField);
    procedure SetRodapeColeta(const Value: TCmDbField);
    procedure SetTrasObs(const Value: TCmDbField);
    procedure SetTxJuros(const Value: TCmDbField);
    procedure SetOpdestino(const Value: TCmDbField);
    procedure SetFlgMargemOC(const Value: TCmDbField);
    procedure SetCodCentRespon(const Value: TCmDbField);
    procedure SetFlgDataEmissao(const Value: TCmDbField);
    procedure SetFlgAcessLancDoc(const Value: TCmDbField);

  public

     Property TxJuros       : TCmDbField read FTxJuros write SetTxJuros;
     Property TrasObs       : TCmDbField read FTrasObs write SetTrasObs;
     Property RodapeColeta  : TCmDbField read FRodapeColeta write SetRodapeColeta;
     Property PesoPreco     : TCmDbField read FPesoPreco write SetPesoPreco;
     Property PesoPrazoPgto : TCmDbField read FPesoPrazoPgto write SetPesoPrazoPgto;
     Property PesoPrazoEnt  : TCmDbField read FPesoPrazoEnt write SetPesoPrazoEnt;
     Property PesoAvaliacao : TCmDbField read FPesoAvaliacao write SetPesoAvaliacao;
     Property NumavAliacoes : TCmDbField read FNumavAliacoes write SetNumavAliacoes;
     Property ModeloImpOC   : TCmDbField read FModeloImpOC write SetModeloImpOC;
     Property InstrucaoOC   : TCmDbField read FInstrucaoOC write SetInstrucaoOC;
     Property ImpObsAparte  : TCmDbField read FImpObsAparte write SetImpObsAparte;
     Property ImpLogo       : TCmDbField read FImpLogo write SetImpLogo;
     Property IdPessoa      : TCmDbField read FIdPessoa write SetIdPessoa;
     Property FlgVerifRAD   : TCmDbField read FFlgVerifRAD write SetFlgVerifRAD;
     Property FlgOrcamento  : TCmDbField read FFlgOrcamento write SetFlgOrcamento;
     Property FlgObsSCIOC   : TCmDbField read FFlgObsSCIOC write SetFlgObsSCIOC;
     Property ComprarAlemSC : TCmDbField read FComprarAlemSC write SetComprarAlemSC;
     Property CodTipDoc     : TCmDbField read FCodTipDoc write SetCodTipDoc;
     Property CabecColeta   : TCmDbField read FCabecColeta write SetCabecColeta;
     Property Assinatura3   : TCmDbField read FAssinatura3 write SetAssinatura3;
     Property Assinatura2   : TCmDbField read FAssinatura2 write SetAssinatura2;
     Property Assinatura1   : TCmDbField read FAssinatura1 write SetAssinatura1;

     Property Opdestino     : TCmDbField read FOpdestino write SetOpdestino;

     Property FlgMargemOC  : TCmDbField read FFlgMargemOC write SetFlgMargemOC;

     property CodCentRespon: TCmDbField read FCodCentRespon write SetCodCentRespon;

     property FlgDataEmissao: TCmDbField read FFlgDataEmissao write SetFlgDataEmissao;

     property FlgAcessLancDoc: TCmDbField read FFlgAcessLancDoc write SetFlgAcessLancDoc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamCompras }

constructor TDbParamCompras.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMCOMPRAS';

   fTxjuros       := CreateCmDbField('TXJUROS',ftfloat,False,False,False,True,'');
   fTrasobs       := CreateCmDbField('TRASOBS',ftString,False,False,False,True,'');
   fRodapecoleta  := CreateCmDbField('RODAPECOLETA',ftString,False,False,False,True,'');
   fPesopreco     := CreateCmDbField('PESOPRECO',ftfloat,False,False,False,True,'');
   fPesoprazopgto := CreateCmDbField('PESOPRAZOPGTO',ftfloat,False,False,False,True,'');
   fPesoprazoent  := CreateCmDbField('PESOPRAZOENT',ftfloat,False,False,False,True,'');
   fPesoavaliacao := CreateCmDbField('PESOAVALIACAO',ftfloat,False,False,False,True,'');
   fNumavaliacoes := CreateCmDbField('NUMAVALIACOES',ftfloat,False,False,False,True,'');
   fModeloimpoc   := CreateCmDbField('MODELOIMPOC',ftfloat,False,False,False,True,'');
   fInstrucaooc   := CreateCmDbField('INSTRUCAOOC',ftBlob,False,False,False,True,'');
   fImpobsaparte  := CreateCmDbField('IMPOBSAPARTE',ftfloat,False,False,False,True,'');
   fImplogo       := CreateCmDbField('IMPLOGO',ftString,False,False,False,True,'');
   fIdpessoa      := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fFlgverifrad   := CreateCmDbField('FLGVERIFRAD',ftString,False,False,False,True,'');
   fFlgorcamento  := CreateCmDbField('FLGORCAMENTO',ftString,False,False,False,True,'');
   fFlgobsscioc   := CreateCmDbField('FLGOBSSCIOC',ftString,False,False,False,True,'');
   fCompraralemsc := CreateCmDbField('COMPRARALEMSC',ftfloat,False,False,False,True,'');
   fCodtipdoc     := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCabeccoleta   := CreateCmDbField('CABECCOLETA',ftString,False,False,False,True,'');
   fAssinatura3   := CreateCmDbField('ASSINATURA3',ftString,False,False,False,True,'');
   fAssinatura2   := CreateCmDbField('ASSINATURA2',ftString,False,False,False,True,'');
   fAssinatura1   := CreateCmDbField('ASSINATURA1',ftString,False,False,False,True,'');

   fOpdestino     := CreateCmDbField('OPDESTINO',ftString,False,False,False,True,'');

   FFlgMargemOC   := CreateCmDbField('FLGMARGEMOC',ftFloat,False,False,False,True,'');

   FCodCentRespon  := CreateCmDbField('CODCENTRORESPON', ftString, False,False,False,True,'');

   FFlgDataEmissao := CreateCmDbField('FLGDATAEMISSAO',ftString,False,False,False,True,'');

   FFlgAcessLancDoc := CreateCmDbField('FLGACESSLANCDOC',ftString,False,False,False,True,'');

end;

function TDbParamCompras.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbParamCompras.SetAssinatura1(const Value: TCmDbField);
begin
  FAssinatura1 := Value;
end;

procedure TDbParamCompras.SetAssinatura2(const Value: TCmDbField);
begin
  FAssinatura2 := Value;
end;

procedure TDbParamCompras.SetAssinatura3(const Value: TCmDbField);
begin
  FAssinatura3 := Value;
end;

procedure TDbParamCompras.SetCabecColeta(const Value: TCmDbField);
begin
  FCabecColeta := Value;
end;

procedure TDbParamCompras.SetCodTipDoc(const Value: TCmDbField);
begin
  FCodTipDoc := Value;
end;

procedure TDbParamCompras.SetComprarAlemSC(const Value: TCmDbField);
begin
  FComprarAlemSC := Value;
end;

procedure TDbParamCompras.SetFlgObsSCIOC(const Value: TCmDbField);
begin
  FFlgObsSCIOC := Value;
end;

procedure TDbParamCompras.SetFlgOrcamento(const Value: TCmDbField);
begin
  FFlgOrcamento := Value;
end;

procedure TDbParamCompras.SetFlgVerifRAD(const Value: TCmDbField);
begin
  FFlgVerifRAD := Value;
end;

procedure TDbParamCompras.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbParamCompras.SetImpLogo(const Value: TCmDbField);
begin
  FImpLogo := Value;
end;

procedure TDbParamCompras.SetImpObsAparte(const Value: TCmDbField);
begin
  FImpObsAparte := Value;
end;

procedure TDbParamCompras.SetInstrucaoOC(const Value: TCmDbField);
begin
  FInstrucaoOC := Value;
end;

procedure TDbParamCompras.SetModeloImpOC(const Value: TCmDbField);
begin
  FModeloImpOC := Value;
end;

procedure TDbParamCompras.SetNumavAliacoes(const Value: TCmDbField);
begin
  FNumavAliacoes := Value;
end;

procedure TDbParamCompras.SetOpdestino(const Value: TCmDbField);
begin
  FOpdestino := Value;
end;

procedure TDbParamCompras.SetPesoAvaliacao(const Value: TCmDbField);
begin
  FPesoAvaliacao := Value;
end;

procedure TDbParamCompras.SetPesoPrazoEnt(const Value: TCmDbField);
begin
  FPesoPrazoEnt := Value;
end;

procedure TDbParamCompras.SetPesoPrazoPgto(const Value: TCmDbField);
begin
  FPesoPrazoPgto := Value;
end;

procedure TDbParamCompras.SetPesoPreco(const Value: TCmDbField);
begin
  FPesoPreco := Value;
end;

procedure TDbParamCompras.SetRodapeColeta(const Value: TCmDbField);
begin
  FRodapeColeta := Value;
end;

procedure TDbParamCompras.SetTrasObs(const Value: TCmDbField);
begin
  FTrasObs := Value;
end;

procedure TDbParamCompras.SetTxJuros(const Value: TCmDbField);
begin
  FTxJuros := Value;
end;

procedure TDbParamCompras.SetFlgMargemOC(const Value: TCmDbField);
begin
  FFlgMargemOC := Value;
end;

procedure TDbParamCompras.SetCodCentRespon(const Value: TCmDbField);
begin
 FCodCentRespon := Value
end;

procedure TDbParamCompras.SetFlgDataEmissao(const Value: TCmDbField);
begin
  FFlgDataEmissao := Value;
end;

procedure TDbParamCompras.SetFlgAcessLancDoc(const Value: TCmDbField);
begin
  FFlgAcessLancDoc := Value;
end;

end.



