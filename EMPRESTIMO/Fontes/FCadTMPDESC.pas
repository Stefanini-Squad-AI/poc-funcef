unit FCadTMPDESC;

// Alterações:
{
 --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
 --------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCSImob, Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb, StdCtrls,
   CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables,
   IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr,
   TB97Ctls, TB97, ExtCtrls, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, UDataBase;

type
   TfrmCadTMPDESC = class(TfrmCadastroCSImob)
      Label1: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label10: TLabel;
      dbeContrato: TwwDBEdit;
      wwDBEdit3: TwwDBEdit;
      Label20: TLabel;
      wwDBEdit5: TwwDBEdit;
      wwDBEdit6: TwwDBEdit;
      wwDBEdit4: TwwDBEdit;
      Label5: TLabel;
      wwDBEdit7: TwwDBEdit;
      Label6: TLabel;
      wwDBEdit1: TwwDBEdit;
      Label2: TLabel;
      qryIDMODULO: TFloatField;
      qryIDDESCONTO: TFloatField;
      qryORDEM: TFloatField;
      qryMESCOBRANCA: TStringField;
      qryMESREFERENCIA: TStringField;
      qryIDEMPRESAPROP: TFloatField;
      qryIDPESSOA: TFloatField;
      qryFLGTIPODESC: TStringField;
      qryIDTITULAR: TFloatField;
      qryDATARECEBIMENTO: TDateTimeField;
      qryIDPESSJUR: TFloatField;
      qryIDPROVENTO: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryMATRICULA: TStringField;
      qryINSCRICAONUMERO: TFloatField;
      qryCODPROVDESC: TStringField;
      qryFLGDESCFOLHA: TStringField;
      qryDATAREFERENCIA: TDateTimeField;
      qryREFERENCIA: TStringField;
      qryFLGATRASODEVOL: TStringField;
      qryDATACOBRANCA: TDateTimeField;
      qryIDLOTE: TFloatField;
      qrySITENVIO: TStringField;
      qryTRGDTINCLUSAO: TDateTimeField;
      qryTRGUSERINCLUSAO: TStringField;
      qryLOTEPREVIA: TFloatField;
      qryVALORINFO: TFloatField;
      qryVALOR: TFloatField;
      qryVALORRECEBIDO: TFloatField;
      Label7: TLabel;
      wwDBEdit2: TwwDBEdit;
      Label8: TLabel;
      DBedtDataReceb: TCMDateTimePicker;
      wwDBEdit8: TwwDBEdit;
      Label9: TLabel;
      qryIDHISTMOVEMPTMO: TFloatField;
      qryIDTMPDESC: TFloatField;
      Label11: TLabel;
      wwDBEdit9: TwwDBEdit;
      wwDBEdit10: TwwDBEdit;
      Label12: TLabel;
      wwDBEdit11: TwwDBEdit;
      Label13: TLabel;
      Label14: TLabel;
      wwDBEdit12: TwwDBEdit;

      procedure FormShow(Sender: TObject);


   private // Private declarations

   public // Public declarations

   end;



var
   frmCadTMPDESC: TfrmCadTMPDESC;



implementation
{$R *.DFM}



procedure TfrmCadTMPDESC.FormShow(Sender: TObject);
begin
   inherited;
   sbtnAlterarClick(Self);
end;



end.
