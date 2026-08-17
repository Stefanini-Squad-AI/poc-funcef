// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor(a)   : Augusto
//  Data       : 19/04/2006
//  Descrição  : Permitir diminuir ou aumentar o numero de parcelas recalculando o valor
//------------------------------------------------------------------------------
//  Rotina     : RubricaBloqueada
//  Autor(a)   : Augusto
//  Data       : 31/05/2005
//  Descrição  : Opção para alterar o numero de parcelas e recalcular valor a parcelar 
//------------------------------------------------------------------------------
//  Rotina     : RubricaBloqueada
//  Autor(a)   : Augusto
//  Data       : 23/11/2004
//  Descrição  : Nova função para informar caso a rubrica esteja bloqueada
//------------------------------------------------------------------------------
// Rotina      : ---//--
// Autor(a)    : Leo
// Data        : 04.05.2004
// Descricao   : alteração geral da função
//------------------------------------------------------------------------------

unit FParcelamentoRevisao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Spin, Db, DBTables, Wwquery, wwdblook;

type
  TfrmParcelamentoRevisao = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    redINSS: TRealEdit;
    redBeneficio: TRealEdit;
    redContribuicao: TRealEdit;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edRegraMargem: TEdit;
    sedNumParcInss: TSpinEdit;
    sedNumParcBenef: TSpinEdit;
    sedNumParcContrib: TSpinEdit;
    Label4: TLabel;
    redMargem: TRealEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    redINSSParc: TRealEdit;
    redBeneficioParc: TRealEdit;
    redContribuicaoParc: TRealEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    redVlrParcINSS: TRealEdit;
    redVlrParcBenef: TRealEdit;
    redVlrParcContrib: TRealEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sedNumParcInssChange(Sender: TObject);
    procedure sedNumParcBenefChange(Sender: TObject);
    procedure sedNumParcContribChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    dTotalCreditos : double;
    dTotalDebitos  : double;
  public
    { Public declarations }
  end;

var
  frmParcelamentoRevisao: TfrmParcelamentoRevisao;
  Function RubricaBloqueada (QryAux: TwwQuery; iIdRubrica : Integer): Boolean; 


implementation

uses uDataBase;

{$R *.DFM}


procedure TfrmParcelamentoRevisao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;

end;

procedure TfrmParcelamentoRevisao.sedNumParcInssChange(Sender: TObject);
begin
  inherited;
    redVlrParcINSS.value :=  redINSSParc.value / sedNumParcInss.value;
end;

procedure TfrmParcelamentoRevisao.sedNumParcBenefChange(Sender: TObject);
begin
  inherited;
  redVlrParcBenef.value :=  redBeneficioParc.value / sedNumParcBenef.value;
end;

procedure TfrmParcelamentoRevisao.sedNumParcContribChange(Sender: TObject);
begin
  inherited;
  redVlrParcContrib.value :=  redContribuicaoParc.value / sedNumParcContrib.value;
end;

{ Verifica se a rubrica esta bloqueada }
function RubricaBloqueada(QryAux: TwwQuery; iIdRubrica: Integer): Boolean;
Var
  sSQL : String;
begin
  Result := False;
  sSQL := ' SELECT FLGESTADORUB FROM PROVDESC WHERE IDPROVENTO = '+IntToStr(iIdRubrica);
  If FazQuery(QryAux, sSQL) Then Begin
    If QryAux.FieldByName('FLGESTADORUB').AsInteger = 2 Then Result := True;
  End;
end;

procedure TfrmParcelamentoRevisao.FormShow(Sender: TObject);
begin
  inherited;

  If sedNumParcInss.Value    = 0 Then  sedNumParcInss.Enabled    := False;
  If sedNumParcBenef.Value   = 0 Then  sedNumParcBenef.Enabled   := False;
  If sedNumParcContrib.Value = 0 Then  sedNumParcContrib.Enabled := False;
end;

end.
