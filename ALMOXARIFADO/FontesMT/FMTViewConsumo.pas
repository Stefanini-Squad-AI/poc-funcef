unit FMTViewConsumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, TREdit, MontaSelect,
  Db, Wwdatsrc, DBClient, uCMClientDataSet, uCtrlArtigo, uCtrlMovEstoque;

type
  TFrmMTViewConsumo = class(TfrmSairAjuda)
    dsUltComp: TwwDataSource;
    MontaSelect: TMontaSelect;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    lbEstDia: TLabel;
    edCodArt: TEdit;
    edDesc: TEdit;
    edUn: TEdit;
    edGrp: TEdit;
    edSaldo: TRealEdit;
    Panel2: TPanel;
    LbAnoPass: TLabel;
    lbAnoAtu: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel3: TPanel;
    edUlt3mDiaAnoPass: TRealEdit;
    edUlt10dDiaAnoPass: TRealEdit;
    edUltMesDiaAnoPass: TRealEdit;
    edUlt3mDiaAnoAtu: TRealEdit;
    edUlt10dDiaAnoAtu: TRealEdit;
    edUltMesDiaAnoAtu: TRealEdit;
    edUlt3mTotAnoAtu: TRealEdit;
    edUlt10dTotAnoAtu: TRealEdit;
    edUltMesTotAnoAtu: TRealEdit;
    edUlt3mTotAnoPass: TRealEdit;
    edUlt10dTotAnoPass: TRealEdit;
    edUltMesTotAnoPass: TRealEdit;
    Panel1: TPanel;
    GrdUltComp: TwwDBGrid;
    Panel4: TPanel;
    cdsConsMedDia: TCMClientDataSet;
    cdsConsMedTot: TCMClientDataSet;
    cdsUltComp: TCMClientDataSet;
    BtnSel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
  private
    { Private declarations }
    Artigo      : TCtrlArtigo;
    MovEstoque  : TCtrlMovEstoque;

    Procedure Sel;
    Function CalcConsMedDia(iDia : Integer; sArt : String; Di,Df : TDateTime) : Double;
    Function CalcConsMedTot(sArt : String; Di,Df : TDateTime) : Double;
  public
    { Public declarations }
  end;

var
  FrmMTViewConsumo: TFrmMTViewConsumo;

implementation

{$R *.DFM}

{ TFrmMTViewConsumo }


Uses uSistema, uModulo, DBaseDados, uMensErro;

procedure TFrmMTViewConsumo.FormCreate(Sender: TObject);
Var
  Ano,x : Word;
begin
  inherited;
  //
  DecodeDate( Date,ano,x,x);
  lbAnoAtu.Caption  := 'Ano '+ IntToStr(Ano);
  lbAnoPass.Caption := 'Ano '+ IntToStr(Ano-1);

  MovEstoque := TCtrlMovEstoque.Create;
  MovEstoque.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  Artigo := TCtrlArtigo.Create;
  Artigo.InitializeAs(MovEstoque);
end;

function TFrmMTViewConsumo.CalcConsMedDia(iDia: Integer; sArt: String; Di,
  Df: TDateTime): Double;
begin
   cdsConsMedDia.Data := Artigo.ListConsMedioDia(Sistema.IdEmpresa,sArt,iDia,Di,Df);
   
   Result := cdsConsMedDia.FieldByName('CONSUMO').AsFloat;
end;

function TFrmMTViewConsumo.CalcConsMedTot(sArt: String; Di,
  Df: TDateTime): Double;
begin
   cdsConsMedTot.Data := Artigo.ListConsMedioTotal(Sistema.IdEmpresa,sArt,Di,Df);

   Result := cdsConsMedTot.FieldByName('CONSUMO').AsFloat;
end;

procedure TFrmMTViewConsumo.Sel;
Var
   ano,mes,x : Word;
   iEstdia   : Integer;
Begin
   MontaSelect.Executar;
   If MontaSelect.RetornouValor Then
      Begin
         edCodArt.Text := MontaSelect.ValoresChave[0];
         edDesc.Text   := MontaSelect.ValoresChave[1];
         edGrp.Text    := MontaSelect.ValoresChave[2];
         edUn.Text     := MontaSelect.ValoresChave[3];
         //
         edSaldo.Value := MovEstoque.InfoSaldo(Sistema.IdEmpresa,MontaSelect.ValoresChave[0],Modulo.iCodAlmoxa,Date);
         //
         cdsUltComp.Data := Artigo.ListUltCompra(MontaSelect.ValoresChave[0]);
         // * Ano Atual
         // Consumo dos ultimos 03 meses
            edUlt3mDiaAnoAtu.Value := CalcConsMedDia(90,MontaSelect.ValoresChave[0],Date-90,Date);
            edUlt3mTotAnoAtu.Value := CalcConsMedTot(MontaSelect.ValoresChave[0],Date-90,Date);
         // Consumo dos ultimos 10 dias
            edUlt10dDiaAnoAtu.Value := CalcConsMedDia(10,MontaSelect.ValoresChave[0],Date-10,Date);
            edUlt10dTotAnoAtu.Value := CalcConsMedTot(MontaSelect.ValoresChave[0],Date-10,Date);
         // Consumo do ultimo mes
            DecodeDate( Date,ano,mes,x);
            edUltMesDiaAnoAtu.Value := CalcConsMedDia(x,MontaSelect.ValoresChave[0],StrToDate('01/'+IntToStr(Mes)+'/'+IntToStr(Ano)) ,Date);
            edUltMesTotAnoAtu.Value := CalcConsMedTot(MontaSelect.ValoresChave[0],StrToDate('01/'+IntToStr(Mes)+'/'+IntToStr(Ano)) ,Date);
         // * Ano Passado
         // Consumo dos ultimos 03 meses
            edUlt3mDiaAnoPass.Value := CalcConsMedDia(90,MontaSelect.ValoresChave[0],Date-365-90,Date-365);
            edUlt3mTotAnoPass.Value := CalcConsMedTot(MontaSelect.ValoresChave[0],Date-365-90,Date-365);
         // Consumo dos ultimos 10 dias
            edUlt10dDiaAnoPass.Value := CalcConsMedDia(10,MontaSelect.ValoresChave[0],Date-365-10,Date-365);
            edUlt10dTotAnoPass.Value := CalcConsMedTot(MontaSelect.ValoresChave[0],Date-365-10,Date-365);
         // Consumo do ultimo mes
            DecodeDate( Date-365,ano,mes,x);
            edUltMesDiaAnoPass.Value := CalcConsMedDia(x,MontaSelect.ValoresChave[0],StrToDate('01/'+IntToStr(Mes)+'/'+IntToStr(Ano)) ,Date-365);
            edUltMesTotAnoPass.Value := CalcConsMedTot(MontaSelect.ValoresChave[0],StrToDate('01/'+IntToStr(Mes)+'/'+IntToStr(Ano)) ,Date-365);

         If (edUlt3mDiaAnoAtu.Value = 0) Then
            lbEstDia.Caption := 'Estoque suficiente para 0 dias'
         Else
            Begin
               iEstdia := Trunc(edSaldo.Value / edUlt3mDiaAnoAtu.Value);
               lbEstDia.Caption := 'Estoque suficiente para '+IntToStr(iEstdia) +' dias';
            End;
      End;
end;

procedure TFrmMTViewConsumo.BtnSelClick(Sender: TObject);
begin
  inherited;
  Sel;
end;

end.
