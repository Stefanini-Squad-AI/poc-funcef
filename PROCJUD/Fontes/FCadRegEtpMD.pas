unit FCadRegEtpMD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDet, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, MAHlpBtn, TB97Tlbr, TB97, DBCtrls, Buttons, Grids,
  Wwdbigrd, Wwdbgrid, StdCtrls, ComCtrls, ExtCtrls, DBTables, Wwtable;

type
  TfrmCadRegEtpMD = class(TfrmCadMestreDetalhe)
    tblProcesso: TwwTable;
    tblProcessoNUMPROCTRAB: TFloatField;
    tblProcessoIDRECLAMANTE: TFloatField;
    tblProcessoRECLAMANTE: TStringField;
    tblProcessoCUSTOPROC: TFloatField;
    tblProcessoIDADVOGRECDA: TFloatField;
    tblProcessoDESPESAPROC: TFloatField;
    tblEtapa: TwwTable;
    tblEtapaNUMSEQ: TFloatField;
    tblEtapaETAPA: TStringField;
    tblEtapaDATAREALOCOR: TDateTimeField;
    tblEtapaASSUNTO: TStringField;
    tblEtapaNUMPROCTRAB: TFloatField;
    tblEtapaCODTIPORECURSO: TFloatField;
    tblEtapaVALORREC: TFloatField;
    tblEtapaOBSERVETAPA: TMemoField;
    tblEtapaIDIMAGEM: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRegEtpMD: TfrmCadRegEtpMD;

implementation

{$R *.DFM}

end.
