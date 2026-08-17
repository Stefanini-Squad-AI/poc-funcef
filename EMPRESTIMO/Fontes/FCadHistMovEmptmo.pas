unit FCadHistMovEmptmo;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroCSImob, Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb, StdCtrls,
   CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect, DBTables,
   IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr,
   TB97Ctls, TB97, ExtCtrls, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, UDataBase;

type
   TfrmCadHistMovEmptmo = class(TfrmCadastroCSImob)
      Label1: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      DBspnParcela: TwwDBSpinEdit;
      Label5: TLabel;
      DBspnSeq: TwwDBSpinEdit;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      dbsParcRest: TwwDBSpinEdit;
      Label11: TLabel;
      DBedtDtCancelamento: TCMDateTimePicker;
      DBedtDtEfetiva: TCMDateTimePicker;
      Label12: TLabel;
      Label13: TLabel;
      DBedtContrato: TwwDBEdit;
      dbeValorPrevisto: TwwDBEdit;
      dbeValorEfetivo: TwwDBEdit;
      dbeSaldoDeve: TwwDBEdit;
      qryIDHISTMOVEMPTMO: TFloatField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryIDITEMEMPTMO: TFloatField;
      qryHMEPARCELA: TFloatField;
      qryHMETIPOMOV: TFloatField;
      qryHMEORIGEM: TFloatField;
      qryHMEFORMACOBRANCA: TStringField;
      qryHMESEQCOBRANCA: TFloatField;
      qryHMEDATA: TDateTimeField;
      qryHMEDATAPREVISTA: TDateTimeField;
      qryHMEDATAEFETIVA: TDateTimeField;
      qryHMEDATAATUALIZA: TDateTimeField;
      qryHMEANOCOMPETENCIA: TFloatField;
      qryHMEMESCOMPETENCIA: TFloatField;
      qryHMEANOCOBRANCA: TFloatField;
      qryHMEMESCOBRANCA: TFloatField;
      qryHMEVLRPREVISTO: TFloatField;
      qryHMEVLREFETIVO: TFloatField;
      qryHMESALDODEV: TFloatField;
      qryHMENUMPARCELAS: TFloatField;
      qryFLGBAIXADO: TFloatField;
      qryHMEDATAVENCTO: TDateTimeField;
      qryHMECENTRALIZA: TFloatField;
      qryHMEDESTACADO: TFloatField;
      DBchkDivergPend: TDBCheckBox;
      Label14: TLabel;
      CMDateTimePicker1: TCMDateTimePicker;
      DBCheckBox3: TDBCheckBox;
      DBCheckBox4: TDBCheckBox;
      DBCheckBox5: TDBCheckBox;
      qryFLGDIVERGPEND: TFloatField;
      DBcboTipoDiverg: TwwDBComboBox;
      qryFLGTIPODIVERG: TFloatField;
      CBchkEnviado: TDBCheckBox;
      qryFLGENVIO: TFloatField;
      CMDateTimePicker2: TCMDateTimePicker;
      Label15: TLabel;
      Bevel1: TBevel;
      qryHMEDATAQUITABONO: TDateTimeField;
      qryFLGABONADO: TFloatField;
      qryFLGQUITADO: TFloatField;
      qryFLGBAIXAMANUAL: TFloatField;
      wwDBEdit1: TwwDBEdit;
      DBRadioGroup1: TDBRadioGroup;
      DBRadioGroup2: TDBRadioGroup;
      wwDBEdit2: TwwDBEdit;
      Label16: TLabel;
      Label17: TLabel;
      qryHMETIPOFOLHA: TStringField;
      qryCODDOCUMENTO: TFloatField;
      qryPLNCODIGO: TFloatField;
      DBedtItem: TwwDBEdit;
      DBedtEvento: TwwDBEdit;
      Label18: TLabel;
      Label19: TLabel;
      DBCheckBox1: TDBCheckBox;
      DBchkSuspensao: TDBCheckBox;
      qryFLGSUSPENSAO: TFloatField;
      Bevel2: TBevel;
      DBCheckBox2: TDBCheckBox;
      CMDateTimePicker3: TCMDateTimePicker;
      Label2: TLabel;
      qryHMEDATAESTORNO: TDateTimeField;
      qryFLGESTORNADO: TFloatField;
      wwDBEdit3: TwwDBEdit;
      wwDBEdit5: TwwDBEdit;
      wwDBEdit4: TwwDBEdit;
      wwDBEdit6: TwwDBEdit;
      DBCheckBox6: TDBCheckBox;
      qryFLGDIVERGTRAT: TFloatField;
    CMDateTimePicker4: TCMDateTimePicker;
    Label20: TLabel;
    Label21: TLabel;
    wwDBEdit7: TwwDBEdit;
    qryPLNCODIGOESTORNO: TFloatField;
    qryFLGENTRADAMANUAL: TFloatField;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    qryVERSAO: TStringField;

      procedure sbtnInserirClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure DBchkDivergPendClick(Sender: TObject);
    procedure DBedtDtEfetivaExit(Sender: TObject);
    procedure dbeValorPrevistoExit(Sender: TObject);
    procedure dbeValorEfetivoExit(Sender: TObject);
    procedure wwDBEdit3Exit(Sender: TObject);
    procedure wwDBEdit5Exit(Sender: TObject);


   private { Private declarations }

   public { Public declarations }

      iAcao       : Integer;
      IDContrato  : Int64;
      IDItem      : Int64;
      IDTipoEP    : Integer;

   end;



var
   frmCadHistMovEmptmo: TfrmCadHistMovEmptmo;



implementation
{$R *.DFM}
uses
   RContrato, uSistema;



procedure TfrmCadHistMovEmptmo.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   qryIDCONTRATOEMPTMO.AsInteger := frmRelContrato.qryIDCONTRATOEMPTMO.AsInteger;

   if DBedtEvento.CanFocus then DBedtEvento.SetFocus;
end;



procedure TfrmCadHistMovEmptmo.FormShow(Sender: TObject);
begin
   inherited;

   case iAcao of

      1: // Inserção
      begin
         sbtnInserirClick(Self);
         dbeValorEfetivo.Text := '';

         qryHMEFORMACOBRANCA.AsString  := 'F';
         qryHMETIPOFOLHA.AsString      := 'B';

         qryHMECENTRALIZA.AsInteger    := 1;
         qryHMEDESTACADO.AsInteger     := 0;

         qryFLGBAIXADO.AsInteger       := 0;
         qryFLGENVIO.AsInteger         := 0;

         qryFLGABONADO.Clear;
         qryFLGQUITADO.Clear;
         qryFLGESTORNADO.Clear;

         qryFLGBAIXAMANUAL.Clear;
         qryFLGENTRADAMANUAL.Clear;
         qryFLGSUSPENSAO.Clear;
         qryFLGDIVERGPEND.Clear;
         qryFLGDIVERGTRAT.Clear;
         qryFLGENTRADAMANUAL.Clear;
      end;

      2: // Alteração
      begin
         sbtnAlterarClick(Self);
      end;

   end;
end;



procedure TfrmCadHistMovEmptmo.CmeCadastroConfirma(Sender: TObject);
begin
   if iAcao = 1 then qryIDHISTMOVEMPTMO.AsInteger := LeUltRegistro(nil, 'HISTMOVEMPTMO');
{
   if iAcao = 1 then begin
      if qryHMETIPOMOV.AsInteger = 4 then begin
         if IDTipoEP = 9 then begin
            qryIDITEMEMPTMO.AsInteger := 26;
         end else begin
            qryIDITEMEMPTMO.AsInteger := 34;
         end;
      end else begin
         if IDTipoEP = 9 then begin
            qryIDITEMEMPTMO.AsInteger :=  5;
         end else begin
            qryIDITEMEMPTMO.AsInteger := 32;
         end;
      end;
   end;
}

   if iAcao = 1 then qryHMEORIGEM.AsInteger        := 12;
   if iAcao = 1 then qryHMEFORMACOBRANCA.AsString  := 'F';
   if iAcao = 1 then qryFLGENTRADAMANUAL.AsInteger := 1;
   if iAcao = 1 then qryHMEORIGEM.AsInteger        := 12;
   if iAcao = 1 then qryVERSAO.AsString            := Sistema.Versao;

   qryHMEDATA.AsDateTime         := qryHMEDATAPREVISTA.AsDateTime;
//   qryHMEDATAATUALIZA.AsDateTime := qryHMEDATAPREVISTA.AsDateTime;
//   qryHMEDATAVENCTO.AsDateTime   := qryHMEDATAPREVISTA.AsDateTime;

   if CBchkEnviado.Checked then
   begin
      qryFLGENVIO.Clear;
   end
   else
   begin
      qryFLGENVIO.AsInteger := 0;
   end;

   if qryHMEFORMACOBRANCA.AsString = 'C' then
   begin
      qryHMETIPOFOLHA.Clear;
   end;


   inherited;

   AplicaAlteracoes([qry]);

   bbtnSairClick(self);
end;



procedure TfrmCadHistMovEmptmo.DBchkDivergPendClick(Sender: TObject);
begin
   inherited;

   DBcboTipoDiverg.Enabled := DBchkDivergPend.Checked;
end;



procedure TfrmCadHistMovEmptmo.DBedtDtEfetivaExit(Sender: TObject);
begin
   inherited;


   if not(qryHMEDATAEFETIVA.IsNull) then
   begin
      qryFLGBAIXADO.AsInteger := 1;
      qryFLGENVIO.AsInteger   := 1;
   end;
end;



procedure TfrmCadHistMovEmptmo.dbeValorPrevistoExit(Sender: TObject);
begin
   inherited;

   if qryHMEVLRPREVISTO.AsInteger = 0 then
   begin
      qryFLGDIVERGPEND.AsInteger := 0;
      qryFLGTIPODIVERG.AsInteger := 2;
      qryFLGDIVERGTRAT.AsInteger := 1;
   end;
end;



procedure TfrmCadHistMovEmptmo.dbeValorEfetivoExit(Sender: TObject);
begin
   inherited;


   if qryHMEVLREFETIVO.AsCurrency <> 0 then
   begin
      qryFLGBAIXADO.AsInteger := 1;
      qryFLGENVIO.AsInteger   := 1;
   end;
end;



procedure TfrmCadHistMovEmptmo.wwDBEdit3Exit(Sender: TObject);
begin
   inherited;
   if iAcao = 1 then qryHMEMESCOBRANCA.AsInteger := qryHMEMESCOMPETENCIA.AsInteger;
end;



procedure TfrmCadHistMovEmptmo.wwDBEdit5Exit(Sender: TObject);
begin
   inherited;
   if iAcao = 1 then qryHMEANOCOBRANCA.AsInteger := qryHMEANOCOMPETENCIA.AsInteger;
end;



end.
