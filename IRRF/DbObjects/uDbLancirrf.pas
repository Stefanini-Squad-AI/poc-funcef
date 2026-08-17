unit uDBLancIRRF;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDBLancIRRF = class(TCmDbObject)

  private
    FVlrCOFINS          : TCmDbField;
    FCodNatureza        : TCmDbField;
    FVlrPIS             : TCmDbField;
    FIDModuloRespon     : TCmDbField;
    FIDPatro            : TCmDbField;
    FVlrIRRFnaocomp     : TCmDbField;
    FDataPagamento      : TCmDbField;
    FVlrBase            : TCmDbField;
    FVlrINSS            : TCmDbField;
    FIDModulo           : TCmDbField;
    FCodCentroRespon    : TCmDbField;
    FCodDocumento       : TCmDbField;
    FVlrDepIRRF         : TCmDbField;
    FIDEmpresa          : TCmDbField;
    FIDLancIRRF         : TCmDbField;
    FCodCentroCusto     : TCmDbField;
    FVlrISS             : TCmDbField;
    FVlrIOF             : TCmDbField;
    FCodigoGPS          : TCmDbField;
    FIDDARF             : TCmDbField;
    FDataLancamento     : TCmDbField;
    FIDDocISS           : TCmDbField;
    FIDPlanoPrev        : TCmDbField;
    FNumDocumento       : TCmDbField;
    FIDMotivo           : TCmDbField;
    FPlaConta           : TCmDbField;
    FPlaContaRecDes     : TCmDbField;
    FIDDocINSS          : TCmDbField;
    FFlgFolha           : TCmDbField;
    FIDBenefIRRF        : TCmDbField;
    FVlrReferencia      : TCmDbField;
    FCodTipRecDes       : TCmDbField;
    FPlano              : TCmDbField;
    FFlgDARM            : TCmDbField;
    FFlgDARF            : TCmDbField;
    FIDHstFolhaBenef    : TCmDbField;
    FIDPessoa           : TCmDbField;
    FVlrIRRF            : TCmDbField;
    FFlgIRRFNaoComp     : TCmDbField;
    FIDImpostoRetido    : TCmDbField;
    FNumLancto          : TCmDbField;
    FIDPrograma         : TCmDbField;
    FPercIRRF           : TCmDbField;
    FVlrCSCOFPIS        : TCmDbField;
    FVlrCSLL            : TCmDbField;
    FUnidNegoc: TCmDbField;

    procedure SetCodCentroCusto(const Value: TCmDbField);
    procedure SetCodCentroRespon(const Value: TCmDbField);
    procedure SetCodDocumento(const Value: TCmDbField);
    procedure SetCodigoGPS(const Value: TCmDbField);
    procedure SetCodNatureza(const Value: TCmDbField);
    procedure SetCodTipRecDes(const Value: TCmDbField);
    procedure SetDataLancamento(const Value: TCmDbField);
    procedure SetDataPagamento(const Value: TCmDbField);
    procedure SetFlgDARF(const Value: TCmDbField);
    procedure SetFlgDARM(const Value: TCmDbField);
    procedure SetFlgFolha(const Value: TCmDbField);
    procedure SetFlgIRRFNaoComp(const Value: TCmDbField);
    procedure SetIDBenefIRRF(const Value: TCmDbField);
    procedure SetIDDARF(const Value: TCmDbField);
    procedure SetIDDocINSS(const Value: TCmDbField);
    procedure SetIDDocISS(const Value: TCmDbField);
    procedure SetIDEmpresa(const Value: TCmDbField);
    procedure SetIDHstFolhaBenef(const Value: TCmDbField);
    procedure SetIDImpostoRetido(const Value: TCmDbField);
    procedure SetIDLancIRRF(const Value: TCmDbField);
    procedure SetIDModulo(const Value: TCmDbField);
    procedure SetIDModuloRespon(const Value: TCmDbField);
    procedure SetIDMotivo(const Value: TCmDbField);
    procedure SetIDPatro(const Value: TCmDbField);
    procedure SetIDPessoa(const Value: TCmDbField);
    procedure SetIDPlanoPrev(const Value: TCmDbField);
    procedure SetIDPrograma(const Value: TCmDbField);
    procedure SetNumDocumento(const Value: TCmDbField);
    procedure SetNumLancto(const Value: TCmDbField);
    procedure SetPercIRRF(const Value: TCmDbField);
    procedure SetPlaConta(const Value: TCmDbField);
    procedure SetPlaContaRecDes(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetVlrBase(const Value: TCmDbField);
    procedure SetVlrCOFINS(const Value: TCmDbField);
    procedure SetVlrCSCOFPIS(const Value: TCmDbField);
    procedure SetVlrCSLL(const Value: TCmDbField);
    procedure SetVlrDepIRRF(const Value: TCmDbField);
    procedure SetVlrINSS(const Value: TCmDbField);
    procedure SetVlrIOF(const Value: TCmDbField);
    procedure SetVlrIRRF(const Value: TCmDbField);
    procedure SetVlrIRRFnaocomp(const Value: TCmDbField);
    procedure SetVlrISS(const Value: TCmDbField);
    procedure SetVlrPIS(const Value: TCmDbField);
    procedure SetVlrReferencia(const Value: TCmDbField);
    procedure SetUnidNegoc(const Value: TCmDbField);


  public

    property VlrReferencia:     TCmDbField read FVlrReferencia    write SetVlrReferencia;
    property VlrPIS:            TCmDbField read FVlrPIS           write SetVlrPIS;
    property VlrISS:            TCmDbField read FVlrISS           write SetVlrISS;
    property VlrIRRFnaocomp:    TCmDbField read FVlrIRRFnaocomp   write SetVlrIRRFnaocomp;
    property VlrIRRF:           TCmDbField read FVlrIRRF          write SetVlrIRRF;
    property VlrIOF:            TCmDbField read FVlrIOF           write SetVlrIOF;
    property VlrINSS:           TCmDbField read FVlrINSS          write SetVlrINSS;
    property VlrDepIRRF:        TCmDbField read FVlrDepIRRF       write SetVlrDepIRRF;
    property VlrCSLL:           TCmDbField read FVlrCSLL          write SetVlrCSLL;
    property VlrCSCOFPIS:       TCmDbField read FVlrCSCOFPIS      write SetVlrCSCOFPIS;
    property VlrCOFINS:         TCmDbField read FVlrCOFINS        write SetVlrCOFINS;
    property VlrBase:           TCmDbField read FVlrBase          write SetVlrBase;
    property Plano:             TCmDbField read FPlano            write SetPlano;
    property PlaContaRecDes:    TCmDbField read FPlaContaRecDes   write SetPlaContaRecDes;
    property PlaConta:          TCmDbField read FPlaConta         write SetPlaConta;
    property PercIRRF:          TCmDbField read FPercIRRF         write SetPercIRRF;
    property NumLancto:         TCmDbField read FNumLancto        write SetNumLancto;
    property NumDocumento:      TCmDbField read FNumDocumento     write SetNumDocumento;
    property IDPrograma:        TCmDbField read FIDPrograma       write SetIDPrograma;
    property IDPlanoPrev:       TCmDbField read FIDPlanoPrev      write SetIDPlanoPrev;
    property IDPessoa:          TCmDbField read FIDPessoa         write SetIDPessoa;
    property IDPatro:           TCmDbField read FIDPatro          write SetIDPatro;
    property IDMotivo:          TCmDbField read FIDMotivo         write SetIDMotivo;
    property IDModuloRespon:    TCmDbField read FIDModuloRespon   write SetIDModuloRespon;
    property IDModulo:          TCmDbField read FIDModulo         write SetIDModulo;
    property IDLancIRRF:        TCmDbField read FIDLancIRRF       write SetIDLancIRRF;
    property IDImpostoRetido:   TCmDbField read FIDImpostoRetido  write SetIDImpostoRetido;
    property IDHstFolhaBenef:   TCmDbField read FIDHstFolhaBenef  write SetIDHstFolhaBenef;
    property IDEmpresa:         TCmDbField read FIDEmpresa        write SetIDEmpresa;
    property IDDocISS:          TCmDbField read FIDDocISS         write SetIDDocISS;
    property IDDocINSS:         TCmDbField read FIDDocINSS        write SetIDDocINSS;
    property IDDARF:            TCmDbField read FIDDARF           write SetIDDARF;
    property IDBenefIRRF:       TCmDbField read FIDBenefIRRF      write SetIDBenefIRRF;
    property FlgIRRFNaoComp:    TCmDbField read FFlgIRRFNaoComp   write SetFlgIRRFNaoComp;
    property FlgFolha:          TCmDbField read FFlgFolha         write SetFlgFolha;
    property FlgDARM:           TCmDbField read FFlgDARM          write SetFlgDARM;
    property FlgDARF:           TCmDbField read FFlgDARF          write SetFlgDARF;
    property DataPagamento:     TCmDbField read FDataPagamento    write SetDataPagamento;
    property DataLancamento:    TCmDbField read FDataLancamento   write SetDataLancamento;
    property CodTipRecDes:      TCmDbField read FCodTipRecDes     write SetCodTipRecDes;
    property CodNatureza:       TCmDbField read FCodNatureza      write SetCodNatureza;
    property CodigoGPS:         TCmDbField read FCodigoGPS        write SetCodigoGPS;
    property CodDocumento:      TCmDbField read FCodDocumento     write SetCodDocumento;
    property CodCentroRespon:   TCmDbField read FCodCentroRespon  write SetCodCentroRespon;
    property CodCentroCusto:    TCmDbField read FCodCentroCusto   write SetCodCentroCusto;
    property UnidNegoc:         TCmDbField read FUnidNegoc        write SetUnidNegoc;

    procedure LimpaCampos;

    constructor Create(Aowner: TCmCustomCdbObject); override;

    function Insert: Boolean; override;

  end;



implementation
{ TDBLancIRRF }



constructor TDBLancIRRF.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'LANCIRRF';

  //                                                                     |Required |Key    |Readonly |NullIfZero
  //                                                        -----------------------------------------------------

  FIDLancIRRF         := CreateCmDbField('IDLANCIRRF',      ftFloat,      True,     True,   False,    True,   '');

  FVlrReferencia      := CreateCmDbField('VLRREFERENCIA',   ftFloat,      False,    False,  False,    False,  '');
  FVlrPIS             := CreateCmDbField('VLRPIS',          ftFloat,      False,    False,  False,    False,  '');
  FVlrISS             := CreateCmDbField('VLRISS',          ftFloat,      False,    False,  False,    False,  '');
  FVlrIRRFNaoComp     := CreateCmDbField('VLRIRRFNAOCOMP',  ftFloat,      False,    False,  False,    False,  '');
  FVlrIRRF            := CreateCmDbField('VLRIRRF',         ftFloat,      False,    False,  False,    False,  '');
  FVlrIOF             := CreateCmDbField('VLRIOF',          ftFloat,      False,    False,  False,    False,  '');
  FVlrINSS            := CreateCmDbField('VLRINSS',         ftFloat,      False,    False,  False,    False,  '');
  FVlrDepIRRF         := CreateCmDbField('VLRDEPIRRF',      ftFloat,      False,    False,  False,    False,  '');
  FVlrCSLL            := CreateCmDbField('VLRCSLL',         ftFloat,      False,    False,  False,    False,  '');
  FVlrCSCOFPIS        := CreateCmDbField('VLRCSCOFPIS',     ftFloat,      False,    False,  False,    False,  '');
  FVlrCOFINS          := CreateCmDbField('VLRCOFINS',       ftFloat,      False,    False,  False,    False,  '');
  FVlrBase            := CreateCmDbField('VLRBASE',         ftFloat,      False,    False,  False,    False,  '');
  FPercIRRF           := CreateCmDbField('PERCIRRF',        ftFloat,      False,    False,  False,    False,  '');

  FIDImpostoRetido    := CreateCmDbField('IDIMPOSTORETIDO', ftFloat,      False,    False,  False,    True,   '');

  FCodDocumento       := CreateCmDbField('CODDOCUMENTO',    ftFloat,      False,    False,  False,    True,   '');
  FNumLancto          := CreateCmDbField('NUMLANCTO',       ftFloat,      False,    False,  False,    True,   '');

  FCodNatureza        := CreateCmDbField('CODNATUREZA',     ftString,     False,    False,  False,    True,   '');
  FCodigoGPS          := CreateCmDbField('CODIGOGPS',       ftFloat,      False,    False,  False,    True,   '');

  FIDDARF             := CreateCmDbField('IDDARF',          ftFloat,      False,    False,  False,    True,   '');
  FIDDocISS           := CreateCmDbField('IDDOCISS',        ftFloat,      False,    False,  False,    True,   '');
  FIDDocINSS          := CreateCmDbField('IDDOCINSS',       ftFloat,      False,    False,  False,    True,   '');

  FDataPagamento      := CreateCmDbField('DATAPAGAMENTO',   ftDateTime,   False,    False,  False,    True,   '');
  FDataLancamento     := CreateCmDbField('DATALANCAMENTO',  ftDateTime,   False,    False,  False,    True,   '');

  FIDModulo           := CreateCmDbField('IDMODULO',        ftFloat,      False,    False,  False,    True,   '');
  FIDModuloRespon     := CreateCmDbField('IDMODULORESPON',  ftFloat,      False,    False,  False,    True,   '');

  FIDPrograma         := CreateCmDbField('IDPROGRAMA',      ftFloat,      False,    False,  False,    True,   '');
  FIDPlanoPrev        := CreateCmDbField('IDPLANOPREV',     ftFloat,      False,    False,  False,    True,   '');
  FIDPatro            := CreateCmDbField('IDPATRO',         ftFloat,      False,    False,  False,    True,   '');

  FIDPessoa           := CreateCmDbField('IDPESSOA',        ftFloat,      False,    False,  False,    True,   '');
  FIDEmpresa          := CreateCmDbField('IDEMPRESA',       ftFloat,      False,    False,  False,    True,   '');
  FPlano              := CreateCmDbField('PLANO',           ftFloat,      False,    False,  False,    True,   '');
  FPlaContaRecDes     := CreateCmDbField('PLACONTARECDES',  ftString,     False,    False,  False,    True,   '');
  FPlaConta           := CreateCmDbField('PLACONTA',        ftString,     False,    False,  False,    True,   '');
  FCodTipRecDes       := CreateCmDbField('CODTIPRECDES',    ftString,     False,    False,  False,    True,   '');
  FCodCentroRespon    := CreateCmDbField('CODCENTRORESPON', ftString,     False,    False,  False,    True,   '');
  FCodCentroCusto     := CreateCmDbField('CODCENTROCUSTO',  ftString,     False,    False,  False,    True,   '');
  FUnidNegoc          := CreateCmDbField('UNIDNEGOC',       ftFloat,      False,    False,  False,    True,   '');

  FIDHstFolhaBenef    := CreateCmDbField('IDHSTFOLHABENEF', ftFloat,      False,    False,  False,    True,   '');
  FIDMotivo           := CreateCmDbField('IDMOTIVO',        ftFloat,      False,    False,  False,    True,   '');

  FIDBenefIRRF        := CreateCmDbField('IDBENEFIRRF',     ftFloat,      False,    False,  False,    True,   '');
  FNumDocumento       := CreateCmDbField('NUMDOCUMENTO',    ftString,     False,    False,  False,    True,   '');

  FFlgIRRFNaoComp     := CreateCmDbField('FLGIRRFNAOCOMP',  ftFloat,      False,    False,  False,    True,   '');

  FFlgFolha           := CreateCmDbField('FLGFOLHA',        ftString,     False,    False,  False,    True,   '');
  FFlgDARM            := CreateCmDbField('FLGDARM',         ftString,     False,    False,  False,    True,   '');
  FFlgDARF            := CreateCmDbField('FLGDARF',         ftString,     False,    False,  False,    True,   '');
end;



function TDBLancIRRF.Insert: Boolean;
begin
  FIDLancIRRF.AsFloat := GetSequence('LANCIRRF');
  Result              := inherited Insert;
end;



procedure TDBLancIRRF.LimpaCampos;
begin
  FVlrReferencia.AsFloat      := 0;
  FVlrPIS.AsFloat             := 0;
  FVlrISS.AsFloat             := 0;
  FVlrIRRFNaoComp.AsFloat     := 0;
  FVlrIRRF.AsFloat            := 0;
  FVlrIOF.AsFloat             := 0;
  FVlrINSS.AsFloat            := 0;
  FVlrDepIRRF.AsFloat         := 0;
  FVlrCSLL.AsFloat            := 0;
  FVlrCSCOFPIS.AsFloat        := 0;
  FVlrCOFINS.AsFloat          := 0;
  FVlrBase.AsFloat            := 0;
  FPercIRRF.AsFloat           := 0;

  FIDImpostoRetido.AsFloat    := 0;
  FCodDocumento.AsFloat       := 0;
  FNumLancto.AsFloat          := 0;

  FCodigoGPS.AsFloat          := 0;
  FIDDARF.AsFloat             := 0;
  FIDDocISS.AsFloat           := 0;
  FIDDocINSS.AsFloat          := 0;

  FDataPagamento.AsDateTime   := 0;
  FDataLancamento.AsDateTime  := 0;

  FIDModulo.AsFloat           := 0;
  FIDModuloRespon.AsFloat     := 0;

  FIDPrograma.AsFloat         := 0;
  FIDPlanoPrev.AsFloat        := 0;
  FIDPatro.AsFloat            := 0;

  FIDPessoa.AsFloat           := 0;
  FIDEmpresa.AsFloat          := 0;

  FPlano.AsFloat              := 0;
  FPlaContaRecDes.AsString    := '';
  FPlaConta.AsString          := '';
  FCodTipRecDes.AsString      := '';
  FCodCentroRespon.AsString   := '';
  FCodCentroCusto.AsString    := '';
  FUnidNegoc.AsFloat          := 0;

  FIDHstFolhaBenef.AsFloat    := 0;
  FIDMotivo.AsFloat           := 0;

  FIDBenefIRRF.AsFloat        := 0;
  FNumDocumento.AsString      := '';

  FFlgIRRFNaoComp.AsFloat     := 0;

  FCodNatureza.AsString       := '';

  FFlgFolha.AsString          := '';
  FFlgDARM.AsString           := '';
  FFlgDARF.AsString           := '';
end;

// -------------------------------------------------------------------------------------------------

procedure TDBLancIRRF.SetCodCentroCusto(const Value: TCmDbField);
begin
  FCodCentroCusto := Value;
end;

procedure TDBLancIRRF.SetCodCentroRespon(const Value: TCmDbField);
begin
  FCodCentroRespon := Value;
end;

procedure TDBLancIRRF.SetCodDocumento(const Value: TCmDbField);
begin
  FCodDocumento := Value;
end;

procedure TDBLancIRRF.SetCodigoGPS(const Value: TCmDbField);
begin
  FCodigoGPS := Value;
end;

procedure TDBLancIRRF.SetCodNatureza(const Value: TCmDbField);
begin
  FCodNatureza := Value;
end;

procedure TDBLancIRRF.SetCodTipRecDes(const Value: TCmDbField);
begin
  FCodTipRecDes := Value;
end;

procedure TDBLancIRRF.SetDataLancamento(const Value: TCmDbField);
begin
  FDataLancamento := Value;
end;

procedure TDBLancIRRF.SetDataPagamento(const Value: TCmDbField);
begin
  FDataPagamento := Value;
end;

procedure TDBLancIRRF.SetFlgDARF(const Value: TCmDbField);
begin
  FFlgDARF := Value;
end;

procedure TDBLancIRRF.SetFlgDARM(const Value: TCmDbField);
begin
  FFlgDARM := Value;
end;

procedure TDBLancIRRF.SetFlgFolha(const Value: TCmDbField);
begin
  FFlgFolha := Value;
end;

procedure TDBLancIRRF.SetFlgIRRFNaoComp(const Value: TCmDbField);
begin
  FFlgIRRFNaoComp := Value;
end;

procedure TDBLancIRRF.SetIDBenefIRRF(const Value: TCmDbField);
begin
  FIDBenefIRRF := Value;
end;

procedure TDBLancIRRF.SetIDDARF(const Value: TCmDbField);
begin
  FIDDARF := Value;
end;

procedure TDBLancIRRF.SetIDDocINSS(const Value: TCmDbField);
begin
  FIDDocINSS := Value;
end;

procedure TDBLancIRRF.SetIDDocISS(const Value: TCmDbField);
begin
  FIDDocISS := Value;
end;

procedure TDBLancIRRF.SetIDEmpresa(const Value: TCmDbField);
begin
  FIDEmpresa := Value;
end;

procedure TDBLancIRRF.SetIDHstFolhaBenef(const Value: TCmDbField);
begin
  FIDHstFolhaBenef := Value;
end;

procedure TDBLancIRRF.SetIDImpostoRetido(const Value: TCmDbField);
begin
  FIDImpostoRetido := Value;
end;

procedure TDBLancIRRF.SetIDLancIRRF(const Value: TCmDbField);
begin
  FIDLancIRRF := Value;
end;

procedure TDBLancIRRF.SetIDModulo(const Value: TCmDbField);
begin
  FIDModulo := Value;
end;

procedure TDBLancIRRF.SetIDModuloRespon(const Value: TCmDbField);
begin
  FIDModuloRespon := Value;
end;

procedure TDBLancIRRF.SetIDMotivo(const Value: TCmDbField);
begin
  FIDMotivo := Value;
end;

procedure TDBLancIRRF.SetIDPatro(const Value: TCmDbField);
begin
  FIDPatro := Value;
end;

procedure TDBLancIRRF.SetIDPessoa(const Value: TCmDbField);
begin
  FIDPessoa := Value;
end;

procedure TDBLancIRRF.SetIDPlanoPrev(const Value: TCmDbField);
begin
  FIDPlanoPrev := Value;
end;

procedure TDBLancIRRF.SetIDPrograma(const Value: TCmDbField);
begin
  FIDPrograma := Value;
end;

procedure TDBLancIRRF.SetNumDocumento(const Value: TCmDbField);
begin
  FNumDocumento := Value;
end;

procedure TDBLancIRRF.SetNumLancto(const Value: TCmDbField);
begin
  FNumLancto := Value;
end;

procedure TDBLancIRRF.SetPercIRRF(const Value: TCmDbField);
begin
  FPercIRRF := Value;
end;

procedure TDBLancIRRF.SetPlaConta(const Value: TCmDbField);
begin
  FPlaConta := Value;
end;

procedure TDBLancIRRF.SetPlaContaRecDes(const Value: TCmDbField);
begin
  FPlaContaRecDes := Value;
end;

procedure TDBLancIRRF.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDBLancIRRF.SetUnidNegoc(const Value: TCmDbField);
begin
  FUnidNegoc := Value;
end;

procedure TDBLancIRRF.SetVlrBase(const Value: TCmDbField);
begin
  FVlrBase := Value;
end;

procedure TDBLancIRRF.SetVlrCOFINS(const Value: TCmDbField);
begin
  FVlrCOFINS := Value;
end;

procedure TDBLancIRRF.SetVlrCSCOFPIS(const Value: TCmDbField);
begin
  FVlrCSCOFPIS := Value;
end;

procedure TDBLancIRRF.SetVlrCSLL(const Value: TCmDbField);
begin
  FVlrCSLL := Value;
end;

procedure TDBLancIRRF.SetVlrDepIRRF(const Value: TCmDbField);
begin
  FVlrDepIRRF := Value;
end;

procedure TDBLancIRRF.SetVlrINSS(const Value: TCmDbField);
begin
  FVlrINSS := Value;
end;

procedure TDBLancIRRF.SetVlrIOF(const Value: TCmDbField);
begin
  FVlrIOF := Value;
end;

procedure TDBLancIRRF.SetVlrIRRF(const Value: TCmDbField);
begin
  FVlrIRRF := Value;
end;

procedure TDBLancIRRF.SetVlrIRRFnaocomp(const Value: TCmDbField);
begin
  FVlrIRRFnaocomp := Value;
end;

procedure TDBLancIRRF.SetVlrISS(const Value: TCmDbField);
begin
  FVlrISS := Value;
end;

procedure TDBLancIRRF.SetVlrPIS(const Value: TCmDbField);
begin
  FVlrPIS := Value;
end;

procedure TDBLancIRRF.SetVlrReferencia(const Value: TCmDbField);
begin
  FVlrReferencia := Value;
end;

// -------------------------------------------------------------------------------------------------

end.




