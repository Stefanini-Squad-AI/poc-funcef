{ --------------------------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 136124
Nº KINTANA..: 812334
Data........: 10/10/2011
Responsável.: Thaise Amaral Martins
Descrição...: Incluir o novo campo DiaUtilMensal
-------------------------------------------------------------------------------------------------- }

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 26/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbParAlmox;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
   TDbParAlmox = class(TCmDbObject)

   private
      FFlgUsaGrupoReq: TCmDbField;
      FFlgReqSemSaldo: TCmDbField;
      FCodTabProdUtil: TCmDbField;
      FDataRepresa: TCmDbField;
      FDataImplanta: TCmDbField;
      FCodTipDoc: TCmDbField;
      FCodTipDocDevol: TCmDbField;
      FExisteContabil: TCmDbField;
      FRecebAutomatico: TCmDbField;
      FDataUltIntegra: TCmDbField;
      FPercRecebComOC: TCmDbField;
      FFlgContabTransf: TCmDbField;
      FCodAltDevolucao: TCmDbField;
      FFlgInfoValorUN: TCmDbField;
      FIdPessoa: TCmDbField;
      FPercReqMat: TCmDbField;
      FExisteContasPagar: TCmDbField;
      FFlgContabGrupo: TCmDbField;
      FFlgIntegralivro: TCmDbField;
      FIdPlanoPrev: TCmDbField;
      FExisteDV: TCmDbField;
      FIdPatro: TCmDbField;
      FMascGrupoProd: TCmDbField;
      FNumNotaNFDevol: TCmDbField;
      FExisteCompra: TCmDbField;
      FIdPrograma: TCmDbField;
      FFlgIntegraOrc: TCmDbField;
      FGrauGrupProd: TCmDbField;
      FFlgTestaGrau: TCmDbField;
      FDiaUtilMensal: TCmDbField;
    FFDiaUtilMensal: TCmDbField;

      procedure SetCodAltDevolucao(const Value: TCmDbField);
      procedure SetCodTabProdUtil(const Value: TCmDbField);
      procedure SetCodTipDoc(const Value: TCmDbField);
      procedure SetCodTipDocDevol(const Value: TCmDbField);
      procedure SetDataImplanta(const Value: TCmDbField);
      procedure SetDataRepresa(const Value: TCmDbField);
      procedure SetDataUltIntegra(const Value: TCmDbField);
      procedure SetExisteCompra(const Value: TCmDbField);
      procedure SetExisteContabil(const Value: TCmDbField);
      procedure SetExisteContasPagar(const Value: TCmDbField);
      procedure SetExisteDV(const Value: TCmDbField);
      procedure SetFlgContabGrupo(const Value: TCmDbField);
      procedure SetFlgContabTransf(const Value: TCmDbField);
      procedure SetFlgInfoValorUN(const Value: TCmDbField);
      procedure SetFlgIntegralivro(const Value: TCmDbField);
      procedure SetFlgReqSemSaldo(const Value: TCmDbField);
      procedure SetFlgUsaGrupoReq(const Value: TCmDbField);
      procedure SetIdPatro(const Value: TCmDbField);
      procedure SetIdPessoa(const Value: TCmDbField);
      procedure SetIdPlanoPrev(const Value: TCmDbField);
      procedure SetMascGrupoProd(const Value: TCmDbField);
      procedure SetNumNotaNFDevol(const Value: TCmDbField);
      procedure SetPercRecebComOC(const Value: TCmDbField);
      procedure SetPercReqMat(const Value: TCmDbField);
      procedure SetRecebAutomatico(const Value: TCmDbField);
      procedure SetIdPrograma(const Value: TCmDbField);
      procedure SetFlgIntegraOrc(const Value: TCmDbField);
      procedure SetGrauGrupProd(const Value: TCmDbField);
      procedure SetFlgTestaGrau(const Value: TCmDbField);
      procedure SetDiaUtilMensal(const Value: TCmDbField);

   public
      property RecebAutomatico   : TCmDbField read FRecebAutomatico     write SetRecebAutomatico;
      property PercReqMat        : TCmDbField read FPercReqMat          write SetPercReqMat;
      property PercRecebComOC    : TCmDbField read FPercRecebComOC      write SetPercRecebComOC;
      property NumNotaNFDevol    : TCmDbField read FNumNotaNFDevol      write SetNumNotaNFDevol;
      property MascGrupoProd     : TCmDbField read FMascGrupoProd       write SetMascGrupoProd;
      property IdPlanoPrev       : TCmDbField read FIdPlanoPrev         write SetIdPlanoPrev;
      property IdPessoa          : TCmDbField read FIdPessoa            write SetIdPessoa;
      property IdPatro           : TCmDbField read FIdPatro             write SetIdPatro;
      property FlgUsaGrupoReq    : TCmDbField read FFlgUsaGrupoReq      write SetFlgUsaGrupoReq;
      property FlgReqSemSaldo    : TCmDbField read FFlgReqSemSaldo      write SetFlgReqSemSaldo;
      property FlgIntegralivro   : TCmDbField read FFlgIntegralivro     write SetFlgIntegralivro;
      property FlgInfoValorUN    : TCmDbField read FFlgInfoValorUN      write SetFlgInfoValorUN;
      property FlgContabTransf   : TCmDbField read FFlgContabTransf     write SetFlgContabTransf;
      property FlgContabGrupo    : TCmDbField read FFlgContabGrupo      write SetFlgContabGrupo;
      property ExisteDV          : TCmDbField read FExisteDV            write SetExisteDV;
      property ExisteContasPagar : TCmDbField read FExisteContasPagar   write SetExisteContasPagar;
      property ExisteContabil    : TCmDbField read FExisteContabil      write SetExisteContabil;
      property ExisteCompra      : TCmDbField read FExisteCompra        write SetExisteCompra;
      property DataUltIntegra    : TCmDbField read FDataUltIntegra      write SetDataUltIntegra;
      property DataRepresa       : TCmDbField read FDataRepresa         write SetDataRepresa;
      property DataImplanta      : TCmDbField read FDataImplanta        write SetDataImplanta;
      property CodTipDocDevol    : TCmDbField read FCodTipDocDevol      write SetCodTipDocDevol;
      property CodTipDoc         : TCmDbField read FCodTipDoc           write SetCodTipDoc;
      property CodTabProdUtil    : TCmDbField read FCodTabProdUtil      write SetCodTabProdUtil;
      property CodAltDevolucao   : TCmDbField read FCodAltDevolucao     write SetCodAltDevolucao;
      property IdPrograma        : TCmDbField read FIdPrograma          write SetIdPrograma;

      property FlgIntegraOrc     : TCmDbField read FFlgIntegraOrc       write SetFlgIntegraOrc;

      property GrauGrupProd: TCmDbField read FGrauGrupProd write SetGrauGrupProd;
      property FlgTestaGrau: TCmDbField read FFlgTestaGrau write SetFlgTestaGrau;
      property DiaUtilMensal: TCmDbField read FFDiaUtilMensal write SetDiaUtilMensal;


      constructor Create(Aowner: TCmCustomCdbObject); override;

      function Insert :Boolean; override;

   end;



implementation
{ TDbParAlmox }



constructor TDbParAlmox.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;

   ErrorIfNoRowsAffected := False;

   TableName            := 'PARALMOX';

   fRecebautomatico     := CreateCmDbField('RECEBAUTOMATICO',  ftString,   False,   False,   False,   True, '');
   fPercreqmat          := CreateCmDbField('PERCREQMAT',       ftfloat,    False,   False,   False,   True, '');
   fPercrecebcomoc      := CreateCmDbField('PERCRECEBCOMOC',   ftfloat,    False,   False,   False,   True, '');
   fNumnotanfdevol      := CreateCmDbField('NUMNOTANFDEVOL',   ftfloat,    False,   False,   False,   True, '');
   fMascgrupoprod       := CreateCmDbField('MASCGRUPOPROD',    ftString,   False,   False,   False,   True, '');
   fIdplanoprev         := CreateCmDbField('IDPLANOPREV',      ftfloat,    False,   False,   False,   True, '');
   fIdpessoa            := CreateCmDbField('IDPESSOA',         ftfloat,    True,    True,    False,   True, '');
   fIdpatro             := CreateCmDbField('IDPATRO',          ftfloat,    False,   False,   False,   True, '');
   fFlgusagruporeq      := CreateCmDbField('FLGUSAGRUPOREQ',   ftString,   False,   False,   False,   True, '');
   fFlgreqsemsaldo      := CreateCmDbField('FLGREQSEMSALDO',   ftString,   False,   False,   False,   True, '');
   fFlgintegralivro     := CreateCmDbField('FLGINTEGRALIVRO',  ftString,   False,   False,   False,   True, '');
   fFlginfovalorun      := CreateCmDbField('FLGINFOVALORUN',   ftString,   False,   False,   False,   True, '');
   fFlgcontabtransf     := CreateCmDbField('FLGCONTABTRANSF',  ftString,   False,   False,   False,   True, '');
   fFlgcontabgrupo      := CreateCmDbField('FLGCONTABGRUPO',   ftString,   False,   False,   False,   True, '');
   fExistedv            := CreateCmDbField('EXISTEDV',         ftString,   False,   False,   False,   True, '');
   fExistecontaspagar   := CreateCmDbField('EXISTECONTASPAGAR',ftString,   False,   False,   False,   True, '');
   fExistecontabil      := CreateCmDbField('EXISTECONTABIL',   ftString,   False,   False,   False,   True, '');
   fExistecompra        := CreateCmDbField('EXISTECOMPRA',     ftString,   False,   False,   False,   True, '');
   fDataultintegra      := CreateCmDbField('DATAULTINTEGRA',   ftDateTime, False,   False,   False,   True, '');
   fDatarepresa         := CreateCmDbField('DATAREPRESA',      ftDateTime, False,   False,   False,   True, '');
   fDataimplanta        := CreateCmDbField('DATAIMPLANTA',     ftDateTime, False,   False,   False,   True, '');
   fCodtipdocdevol      := CreateCmDbField('CODTIPDOCDEVOL',   ftfloat,    False,   False,   False,   True, '');
   fCodtipdoc           := CreateCmDbField('CODTIPDOC',        ftfloat,    False,   False,   False,   True, '');
   fCodtabprodutil      := CreateCmDbField('CODTABPRODUTIL',   ftString,   False,   False,   False,   True, '');
   fCodaltdevolucao     := CreateCmDbField('CODALTDEVOLUCAO',  ftfloat,    False,   False,   False,   True, '');
   FIdPrograma          := CreateCmDbField('IDPROGRAMA',       ftfloat,    False,   False,   False,   True, '');

   FFlgIntegraOrc       := CreateCmDbField('FLGINTEGRAORC',    ftfloat,    False,   False,   False,   True, '');

   FGrauGrupProd       := CreateCmDbField('GRAUGRUPPROD', ftFloat,   False,   False,   False,   True, '');
   FFlgTestaGrau       := CreateCmDbField('FLGTESTAGRAU', ftInteger,   False,   False,   False,   True, '');
   FDiaUtilMensal      := CreateCmDbField('DIAUTILMENSAL', ftInteger,   False,   False,   False,   True, '');
   //Thaise
end;



function TDbParAlmox.Insert: Boolean;
begin
   Result := Inherited Insert;
end;



procedure TDbParAlmox.SetCodAltDevolucao(const Value: TCmDbField);   begin FCodAltDevolucao     := Value; end;
procedure TDbParAlmox.SetCodTabProdUtil(const Value: TCmDbField);    begin FCodTabProdUtil      := Value; end;
procedure TDbParAlmox.SetCodTipDoc(const Value: TCmDbField);         begin FCodTipDoc           := Value; end;
procedure TDbParAlmox.SetCodTipDocDevol(const Value: TCmDbField);    begin FCodTipDocDevol      := Value; end;
procedure TDbParAlmox.SetDataImplanta(const Value: TCmDbField);      begin FDataImplanta        := Value; end;
procedure TDbParAlmox.SetDataRepresa(const Value: TCmDbField);       begin FDataRepresa         := Value; end;
procedure TDbParAlmox.SetDataUltIntegra(const Value: TCmDbField);    begin FDataUltIntegra      := Value; end;
procedure TDbParAlmox.SetDiaUtilMensal(const Value: TCmDbField);
begin
  FDiaUtilMensal := Value;
end;

procedure TDbParAlmox.SetExisteCompra(const Value: TCmDbField);      begin FExisteCompra        := Value; end;
procedure TDbParAlmox.SetExisteContabil(const Value: TCmDbField);    begin FExisteContabil      := Value; end;
procedure TDbParAlmox.SetExisteContasPagar(const Value: TCmDbField); begin FExisteContasPagar   := Value; end;
procedure TDbParAlmox.SetExisteDV(const Value: TCmDbField);          begin FExisteDV            := Value; end;
procedure TDbParAlmox.SetFlgContabGrupo(const Value: TCmDbField);    begin FFlgContabGrupo      := Value; end;
procedure TDbParAlmox.SetFlgContabTransf(const Value: TCmDbField);   begin FFlgContabTransf     := Value; end;
procedure TDbParAlmox.SetFlgInfoValorUN(const Value: TCmDbField);    begin FFlgInfoValorUN      := Value; end;
procedure TDbParAlmox.SetFlgIntegralivro(const Value: TCmDbField);   begin FFlgIntegralivro     := Value; end;
procedure TDbParAlmox.SetFlgIntegraOrc(const Value: TCmDbField);     begin FFlgIntegraOrc       := Value; end;
procedure TDbParAlmox.SetFlgReqSemSaldo(const Value: TCmDbField);    begin FFlgReqSemSaldo      := Value; end;

procedure TDbParAlmox.SetFlgTestaGrau(const Value: TCmDbField);
begin
  FFlgTestaGrau := Value;
end;

procedure TDbParAlmox.SetFlgUsaGrupoReq(const Value: TCmDbField);    begin FFlgUsaGrupoReq      := Value; end;
procedure TDbParAlmox.SetGrauGrupProd(const Value: TCmDbField);
begin
  FGrauGrupProd := Value;
end;

procedure TDbParAlmox.SetIdPatro(const Value: TCmDbField);           begin FIdPatro             := Value; end;
procedure TDbParAlmox.SetIdPessoa(const Value: TCmDbField);          begin FIdPessoa            := Value; end;
procedure TDbParAlmox.SetIdPlanoPrev(const Value: TCmDbField);       begin FIdPlanoPrev         := Value; end;
procedure TDbParAlmox.SetIdPrograma(const Value: TCmDbField);        begin FIdPrograma          := Value; end;
procedure TDbParAlmox.SetMascGrupoProd(const Value: TCmDbField);     begin FMascGrupoProd       := Value; end;
procedure TDbParAlmox.SetNumNotaNFDevol(const Value: TCmDbField);    begin FNumNotaNFDevol      := Value; end;
procedure TDbParAlmox.SetPercRecebComOC(const Value: TCmDbField);    begin FPercRecebComOC      := Value; end;
procedure TDbParAlmox.SetPercReqMat(const Value: TCmDbField);        begin FPercReqMat          := Value; end;
procedure TDbParAlmox.SetRecebAutomatico(const Value: TCmDbField);   begin FRecebAutomatico     := Value; end;



end.



