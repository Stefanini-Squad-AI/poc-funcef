unit cRelFolhaComparativa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Wwdbspin,
  mContrato, mResponsavel, fcCombo, fcColorCombo, uModuloImobiliario;

type
  TcfgRelFolhaComparativa = class(TcfgRel)
    MolResponsavel1: TMolResponsavel;
    molContrato1: TmolContrato;
    Label15: TLabel;
    cboMesFim: TComboBox;
    DBspnAnoFim: TwwDBSpinEdit;
    Label1: TLabel;
    cboMesIni: TComboBox;
    DBspnAnoIni: TwwDBSpinEdit;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    rdgOrdenacao: TRadioGroup;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure MontaQuery; override;

  public
    { Public declarations }
  end;

var
  cfgRelFolhaComparativa: TcfgRelFolhaComparativa;

implementation

{$R *.DFM}

uses UDiasInUteis, dRelAdminImobCC, UFuncoesImob;

procedure TcfgRelFolhaComparativa.FormCreate(Sender: TObject);
var
   iMes, iAno: integer;
begin
   inherited;
   iMes := DiasInUteis.ExtraiMes(date);
   iAno := DiasInUteis.ExtraiAno(date);
   cboMesFim.ItemIndex := iMes - 1;
   DBspnAnoFim.Value   := iAno;

   if iMes = 1 then begin
      cboMesIni.ItemIndex := 12 - 1;
      DBspnAnoIni.Value   := iAno - 1;
   end else begin
      cboMesIni.ItemIndex := iMes - 2;
      DBspnAnoIni.Value   := iAno;
   end;
end;

procedure TcfgRelFolhaComparativa.MontaQuery;
begin
   inherited;

   LimpaParametros(dtmRelAdminImobCC.qryFolhaComparativa);

   with dtmRelAdminImobCC do begin

      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoComparaAluguel.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoComparaAluguel.Picture := nil;

      rptFolhaComparativa_lblPeriodoIni.Caption := cboMesIni.Text + '/' + inttostr(Word(trunc(DBspnAnoIni.Value)));
      rptFolhaComparativa_lblPeriodoFim.Caption := cboMesFim.Text + '/' + inttostr(Word(trunc(DBspnAnoFim.Value)));

      if MolResponsavel1.edtResponsavel.Text <> '' then begin
         rptFolhaComparativa_responsavel.Caption := MolResponsavel1.edtResponsavel.Text;
         qryFolhaComparativa.ParamByName('PIDRESPONSAVEL').AsInteger := MolResponsavel1.iResponsavel;
      end else begin
         rptFolhaComparativa_responsavel.Caption := '< Todos >';
      end;

      if molContrato1.edtContrato.Text <> '' then begin
         rptFolhaComparativa_contrato.Caption := molContrato1.edtContrato.Text;
         qryFolhaComparativa.ParamByName('PIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;
      end else begin
         rptFolhaComparativa_contrato.Caption := '< Todos >';
      end;

      qryFolhaComparativa.ParamByName('PMESINI').AsInteger := cboMesIni.ItemIndex + 1;
      qryFolhaComparativa.ParamByName('PANOINI').AsInteger := Word(trunc(DBspnAnoIni.Value));
      qryFolhaComparativa.ParamByName('PMESFIM').AsInteger := cboMesFim.ItemIndex + 1;
      qryFolhaComparativa.ParamByName('PANOFIM').AsInteger := Word(trunc(DBspnAnoFim.Value));

      if rdgOrdenacao.ItemIndex = 1 then
         qryFolhaComparativa.ParamByName('ORDEM').AsString := 'NOME';

      qryFolhaComparativa.Open;

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;
   end;

end;

end.
