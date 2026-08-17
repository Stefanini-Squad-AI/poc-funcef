unit FDMRelatoriosClaudio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, Db, ppCtrls, ppBands, ppClass, ppPrnabl, ppProd, ppReport,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppVar,
  ppRelatv, ppDBPipe;

type
  TDMRelatoriosClaudio = class(TdtmReports)
    PpParticEmp: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel16: TppLabel;
    ppLine12: TppLine;
    ppLabel17: TppLabel;
    PpParticEmpLabel1: TppLabel;
    PpParticEmpLabel2: TppLabel;
    PpParticEmpLabel3: TppLabel;
    PpParticEmpLabel4: TppLabel;
    PpParticEmpLabel5: TppLabel;
    PpParticEmpLabel6: TppLabel;
    ppDetailBand7: TppDetailBand;
    PpParticEmpDBText3: TppDBText;
    PpParticEmpDBText5: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine13: TppLine;
    ppLabel18: TppLabel;
    PpParticEmpGroup3: TppGroup;
    PpParticEmpGroupHeaderBand3: TppGroupHeaderBand;
    lbldbEmpresa: TppDBText;
    lbldbTot: TppDBText;
    PpParticEmpGroupFooterBand3: TppGroupFooterBand;
    PpParticEmpDBCalc1: TppDBCalc;
    PpParticEmpLabel7: TppLabel;
    PpParticEmpGroup4: TppGroup;
    PpParticEmpGroupHeaderBand4: TppGroupHeaderBand;
    PpParticEmpDBText2: TppDBText;
    PpParticEmpGroupFooterBand4: TppGroupFooterBand;
    bdeParticEmp: TppBDEPipeline;
    dtsParticEmp: TwwDataSource;
    qryParticEmp: TwwQuery;
    qryParticEmpSALDOQTDEINVCART: TFloatField;
    qryParticEmpDATAMOVCARTINV: TDateTimeField;
    qryParticEmpTOT: TFloatField;
    qryParticEmpPERCPARTICEMPR: TFloatField;
    qryParticEmpNOME: TStringField;
    qryParticEmpDESCINVESTIMENTO: TStringField;
    qryParticEmpDESCCARTINVEST: TStringField;
    qryParticEmpIDEMISSOR: TFloatField;
    qryParticEmpIDCARTEIRAINVEST: TFloatField;
    qryParticEmpIDINVESTIMENTO: TFloatField;
    lblPerc: TppLabel;
    lblAcima: TppLabel;
    PpParticEmpLine1: TppLine;
    PpParticEmpLine2: TppLine;
    PpParticEmpLine3: TppLine;
    PpParticEmpLine4: TppLine;
    PpParticEmpLabel8: TppLabel;
    PpParticEmpDBText6: TppDBText;
    lblPercTot: TppLabel;
    lblAcimaTot: TppLabel;
    lbldbErro: TppLabel;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    procedure ppDetailBand7BeforePrint(Sender: TObject);
    procedure PpParticEmpGroupFooterBand3AfterPrint(Sender: TObject);
    procedure PpParticEmpGroupHeaderBand3BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; OverRide;

  end;

var
  DMRelatoriosClaudio: TDMRelatoriosClaudio;

implementation

uses FParamPerticEmp;

{$R *.DFM}

function TDMRelatoriosClaudio.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  if (UPPERCASE(Form) = 'FRMPARAMPERTICEMP') then
    frm := TfrmParamPerticEmp.Create(Application)

  else if (UPPERCASE(Form) = '') then begin
    Result := True;
    Exit;
  end else
    frm := nil;

  if frm = nil then
    Result := false
  else begin
    with frm do begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TDMRelatoriosClaudio.ppDetailBand7BeforePrint(Sender: TObject);
var
   Perc: Real;
begin
     inherited;
     try
        Perc := qryParticEmp.FieldByName('SaldoQtdeInvCart').AsFloat * 100 /
                qryParticEmp.FieldByName('Tot').AsFloat;
        lblPerc.Text := Format('%3.2f',[Perc]);
        if Perc > qryParticEmp.FieldByName('PERCPARTICEMPR').AsFloat then
        begin
             lblAcima.Text := 'X';
             lblPerc.Font.Color := clRed
        end
        else
        begin
             lblAcima.Text := '';
             lblPerc.Font.Color := clBlack
        end;
     except
           lblPerc.Text := '';
           lblPercTot.Text := '';
           lblAcima.Text := '';
           lblAcimaTot.Text := ''
     end;
end;

procedure TDMRelatoriosClaudio.PpParticEmpGroupFooterBand3AfterPrint(
  Sender: TObject);
var
   Perc: Real;
begin
     inherited;
     try
        Perc := PpParticEmpDBCalc1.Value * 100 /
                qryParticEmp.FieldByName('Tot').AsFloat;
        lblPercTot.Text := Format('%3.2f',[Perc]);
        if Perc > qryParticEmp.FieldByName('PERCPARTICEMPR').AsFloat then
        begin
             lblAcimaTot.Text := 'X';
             lblPercTot.Font.Color := clRed
        end
        else
        begin
             lblAcimaTot.Text := '';
             lblPercTot.Font.Color := clBlack
        end;
     except
           //Não mostra mensagem de erro
     end;
end;

procedure TDMRelatoriosClaudio.PpParticEmpGroupHeaderBand3BeforePrint(
  Sender: TObject);
begin
     inherited;
     if qryParticEmp.FieldByName('Tot').AsFloat = 0 then
     begin
           lbldbTot.Visible := false;
           lbldbErro.Visible := true
     end
     else
     begin
           lbldbTot.Visible := true;
           lbldbErro.Visible := false
     end;
end;

end.
