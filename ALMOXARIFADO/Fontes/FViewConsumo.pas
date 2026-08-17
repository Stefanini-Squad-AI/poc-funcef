unit FViewConsumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Grids, Wwdbigrd, Wwdbgrid, Db,
  Wwdatsrc, DBTables, Wwquery, TREdit;

type
  TFrmViewConsumo = class(TfrmSairAjuda)
    MontaSelect: TMontaSelect;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edCodArt: TEdit;
    edDesc: TEdit;
    edUn: TEdit;
    edGrp: TEdit;
    BtnSel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qryUltComp: TwwQuery;
    qryUltCompVLRUNITARIO: TFloatField;
    qryUltCompVALUNEST: TFloatField;
    qryUltCompCODMEDIDA: TStringField;
    qryUltCompQTDERECEBDEVOL: TFloatField;
    qryUltCompDATAENTDEVOL: TDateTimeField;
    qryUltCompRAZAOSOCIAL: TStringField;
    dsUltComp: TwwDataSource;
    Panel1: TPanel;
    GrdUltComp: TwwDBGrid;
    Panel4: TPanel;
    Label4: TLabel;
    edSaldo: TRealEdit;
    qryConsMedDia: TwwQuery;
    qryConsMedDiaCODARTIGO: TStringField;
    qryConsMedDiaCONSUMO: TFloatField;
    qryConsMedTot: TwwQuery;
    qryConsMedTotCODARTIGO: TStringField;
    qryConsMedTotCONSUMO: TFloatField;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    LbAnoPass: TLabel;
    lbAnoAtu: TLabel;
    edUlt3mDiaAnoPass: TRealEdit;
    edUlt10dDiaAnoPass: TRealEdit;
    edUltMesDiaAnoPass: TRealEdit;
    edUlt3mDiaAnoAtu: TRealEdit;
    edUlt10dDiaAnoAtu: TRealEdit;
    edUltMesDiaAnoAtu: TRealEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edUlt3mTotAnoAtu: TRealEdit;
    edUlt10dTotAnoAtu: TRealEdit;
    edUltMesTotAnoAtu: TRealEdit;
    edUlt3mTotAnoPass: TRealEdit;
    edUlt10dTotAnoPass: TRealEdit;
    edUltMesTotAnoPass: TRealEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lbEstDia: TLabel;
    procedure BtnSelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     Procedure Sel;
     Function CalcConsMedDia(iDia : Integer; sArt : String; Di,Df : TDateTime) : Double;
     Function CalcConsMedTot(sArt : String; Di,Df : TDateTime) : Double;
  public
    { Public declarations }
  end;

var
  FrmViewConsumo: TFrmViewConsumo;

implementation

{$R *.DFM}

Uses uString, uSistema, uMovNew, uModulo;

Procedure TFrmViewConsumo.Sel;
Var
   ano,mes,x : Word;
   iEstdia   : Integer;
Begin
  qryUltComp.Close;
  If Not qryUltComp.Prepared Then qryUltComp.Prepare;
   MontaSelect.Executar;
   If MontaSelect.RetornouValor Then
      Begin
         edCodArt.Text := MontaSelect.ValoresChave[0];
         edDesc.Text   := MontaSelect.ValoresChave[1];
         edGrp.Text    := MontaSelect.ValoresChave[2];
         edUn.Text     := MontaSelect.ValoresChave[3];
         //
         edSaldo.Value := MovNew.InfoSaldo(MontaSelect.ValoresChave[0],Modulo.iCodAlmoxa,Date);
         //
         qryUltComp.Close;
         qryUltComp.ParamByName('CODARTIGO').AsString := Espaco(Trim(MontaSelect.ValoresChave[0]),14);
         qryUltComp.Open;
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
End;

Function TFrmViewConsumo.CalcConsMedDia(iDia : Integer; sArt : String; Di,Df : TDateTime) : Double;
Begin
   qryConsMedDia.Close;
   If Not qryConsMedDia.Prepared Then qryConsMedDia.Prepare;
   qryConsMedDia.ParamByName('DIA').AsInteger        := iDia;
   qryConsMedDia.ParamByName('CODARTIGO').AsString   := Espaco(Trim(sArt),14);
   qryConsMedDia.ParamByName('DATAI').AsDateTime     := Di;
   qryConsMedDia.ParamByName('DATAF').AsDateTime     := Df;
   qryConsMedDia.Open;
   Result := qryConsMedDiaCONSUMO.AsFloat;
End;

Function TFrmViewConsumo.CalcConsMedTot(sArt : String; Di,Df : TDateTime) : Double;
Begin
   qryConsMedTot.Close;
   If Not qryConsMedTot.Prepared Then qryConsMedTot.Prepare;
   qryConsMedTot.ParamByName('CODARTIGO').AsString   := Espaco(Trim(sArt),14);
   qryConsMedTot.ParamByName('DATAI').AsDateTime     := Di;
   qryConsMedTot.ParamByName('DATAF').AsDateTime     := Df;
   qryConsMedTot.Open;
   Result := qryConsMedTotCONSUMO.AsFloat;
End;

procedure TFrmViewConsumo.BtnSelClick(Sender: TObject);
begin
  inherited;
  Sel;
end;

procedure TFrmViewConsumo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryUltComp.Close;
  If qryUltComp.Prepared Then qryUltComp.UnPrepare;
  qryConsMedDia.Close;
  If qryConsMedDia.Prepared Then qryConsMedDia.Prepare;
  qryConsMedTot.Close;
  If qryConsMedTot.Prepared Then qryConsMedTot.Prepare;
end;

procedure TFrmViewConsumo.FormCreate(Sender: TObject);
Var
  Ano,x : Word;
begin
  inherited;
  //
  DecodeDate( Date,ano,x,x);
  lbAnoAtu.Caption  := 'Ano '+ IntToStr(Ano);
  lbAnoPass.Caption := 'Ano '+ IntToStr(Ano-1);
  //
  qryUltComp.Close;
  qryUltComp.ParamByName('CODARTIGO').AsString := '';
  qryUltComp.Open;
end;

end.
