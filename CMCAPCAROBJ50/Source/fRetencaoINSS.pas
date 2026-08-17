{*******************************************************************************
  Alterações:
********************************************************************************
{-------------------------------------------------------------------------------
 Rotinas   : Várias
 Data      : 04/08/2004
 Autor     : David Ayrolla
 Pendências: 16832 e 17232
 Descrição : Limitar a retenção de INSS de autônomos ao teto.
-------------------------------------------------------------------------------}

unit fRetencaoINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Db, DBClient, uCMClientDataSet;

type
  TfrmRetencaoINSS = class(TfrmOkCancelar)
    cdsRetencao: TCMClientDataSet;
    cdsRetencaoVLDOC: TFloatField;
    cdsRetencaoVLRETIDO: TFloatField;
    cdsRetencaoVLINFORMADO: TFloatField;
    cdsRetencaoTETOINSS: TFloatField;
    cdsRetencaoVLTOTAL: TFloatField;
    dtsRetencao: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    lblAte: TLabel;
    Label5: TLabel;
    edtVlAnterior: TDBRealEdit;
    edtVlOutros: TDBRealEdit;
    edtVlImposto: TDBRealEdit;
    edtVlTotal: TDBRealEdit;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure edtVlOutrosExit(Sender: TObject);
  private
    FVlAnterior: Double;
    FVlOutros: Double;
    FVlTotal: Double;
    FVlImposto: Double;
    FVlTeto: Double;

    VlOriginalImp : Double;

    procedure Calcula;
    procedure SetVlAnterior(const Value: Double);
    procedure SetVlImposto(const Value: Double);
    procedure SetVlOutros(const Value: Double);
    procedure SetVlTeto(const Value: Double);
    procedure SetVlTotal(const Value: Double);
  public
    property VlAnterior : Double read FVlAnterior write SetVlAnterior;
    property VlImposto  : Double read FVlImposto write SetVlImposto;
    property VlOutros   : Double read FVlOutros write SetVlOutros;
    property VlTeto     : Double read FVlTeto write SetVlTeto;
    property VlTotal    : Double read FVlTotal write SetVlTotal;
  end;

  //DAVID - Retenção de Imposto
  function RetencaoOutrasEmpresas( IdForCli : integer; DataRetencao : TDateTime;
                                   VlTeto, VlAnterior : Double;
                                   var VlImposto, VlOutros : Double ) : boolean;


var
  frmRetencaoINSS: TfrmRetencaoINSS;

implementation

{$R *.DFM}

procedure TfrmRetencaoINSS.Calcula;
begin
  //Calcula o total (desconsiderando o teto)
  VlTotal := VlAnterior + VlOutros + VlOriginalImp;

  //Se o total ultrapassar o teto, recebe o teto
  if VlTotal > VlTeto then
    VlTotal := VlTeto;

  //Indica o valor do imposto real  
  VlImposto   := VlTotal - ( VlAnterior + VlOutros );

  //Se for negativo, zera
  if VlImposto < 0 then VlImposto := 0;
end;

procedure TfrmRetencaoINSS.FormShow(Sender: TObject);
begin
  inherited;

  VlOriginalImp := VlImposto;

  Calcula;    //Faz o cálculo inicial

end;

procedure TfrmRetencaoINSS.SetVlAnterior(const Value: Double);
begin
  FVlAnterior := Value;
  edtVlAnterior.Value := FVlAnterior;
end;

procedure TfrmRetencaoINSS.SetVlImposto(const Value: Double);
begin
  FVlImposto := Value;
  edtVlImposto.Value := FVlImposto;
end;

procedure TfrmRetencaoINSS.SetVlOutros(const Value: Double);
begin
  FVlOutros   := Value;
  edtVlOutros.Value := FVlOutros;
end;

procedure TfrmRetencaoINSS.SetVlTeto(const Value: Double);
begin
  FVlTeto := Value;
  Caption := 'Retenção de INSS de autônomos  (Teto: ' + FormatFloat( '#,###.##', FVlTeto ) + ')';
end;

procedure TfrmRetencaoINSS.SetVlTotal(const Value: Double);
begin
  FVlTotal := Value;
  edtVlTotal.Value := FVlTotal;
end;

procedure TfrmRetencaoINSS.edtVlOutrosExit(Sender: TObject);
begin
  inherited;
  VlOutros := edtVlOutros.Value;
  Calcula;
end;

function RetencaoOutrasEmpresas( IdForCli : integer; DataRetencao : TDateTime;
                                 VlTeto, VlAnterior : Double;
                                 var VlImposto, VlOutros : Double ) : boolean;
begin
  Result := False;

  //Cria a janela de retenção do INSS
  frmRetencaoINSS := TfrmRetencaoINSS.Create( nil );
  try
    //Informa o teto do INSS
    frmRetencaoINSS.VlTeto := VlTeto;

    //Total retido neste mês até o momento
    frmRetencaoINSS.VlAnterior := VlAnterior;

    //Informa o teto do INSS
    frmRetencaoINSS.VlImposto := VlImposto;

    //Informa o valor de outras empresas
    frmRetencaoINSS.VlOutros := VlOutros;

    //Abre a janela e testa o seu retorno
    if frmRetencaoINSS.ShowModal = mrOk then
    begin
      VlImposto := frmRetencaoINSS.VlImposto;
      VlOutros  := frmRetencaoINSS.VlOutros;
      Result   := True;
    end;

  finally
    frmRetencaoINSS.Free;
  end;
end;

end.
