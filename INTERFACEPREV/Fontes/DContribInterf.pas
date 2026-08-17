unit DContribInterf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TdtmContribInterf = class(TDataModule)
    qryValSal: TwwQuery;
    qryValSalManut: TwwQuery;
    qryValSalVALORPROVENTO: TFloatField;
    qryValSalManutSALMANTIDO: TFloatField;
    qryElegPatro: TwwQuery;
    qryElegPatroDATADEMISSAO: TDateTimeField;
    qryContrib: TwwQuery;
    qryContribIDCONTRIBPAI: TFloatField;
    qryContribVALORBASE1: TFloatField;
    qryContribVALORBASE2: TFloatField;
    qryContribVALORBASE3: TFloatField;
    qryContribIDCONTRIBPAI2: TFloatField;
    qryContribIDCONTRIBPAI3: TFloatField;
    qryContribFLGPAGADORASSOC1: TStringField;
    qryContribFLGPAGADORASSOC2: TStringField;
    qryContribFLGPAGADORASSOC3: TStringField;
    qryOpContrib: TwwQuery;
    qryOpContribVALOR: TFloatField;
    qryOpContribVALORBASE1: TFloatField;
    qryOpContribVALORBASE2: TFloatField;
    qryOpContribVALORBASE3: TFloatField;
    qryLote: TwwQuery;
    qryInsTmpDesc: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmContribInterf: TdtmContribInterf;

implementation

{$R *.DFM}

end.
