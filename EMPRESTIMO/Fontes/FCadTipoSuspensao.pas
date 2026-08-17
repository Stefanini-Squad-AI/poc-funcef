{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL182431 Kintana 1700846
Responsável : Rodrigo de Brito Figueredo
Data        : 28/03/2013
Descrição   : Criado Campo "Tipos de Suspensão".*DFM
--------------------------------------------------------------------------------    
Pendência   : SOL: 144458 Kintana: 1208325
Responsável : Eraldo Silva
Data        : 10/02/2012
Descrição   : Criar campos "Prestação Atual", "Prestação Projetada" e "Margem"
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 122884 - Kintana: 608897
Responsável : Daniel Begnami
Data        : 17/08/2009
Descrição   : Permitir a manipulação do FLAG FLGENVIA da tabela TIPOSUSPEMPTMO.
              Funcionalidade Cadastro de Suspensão.
--------------------------------------------------------------------------------
Pendência   : 108099 - Kintana: 487201
Responsável : Daniel Begnami
Data        : 06/04/2008
Descrição   : Inclusão de dois campos novos: FLGSUSAPENASCONC, PERCENTUAL.
              Criação de novas modalidades de emprestimo.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadTipoSuspensao;

interface

uses
   {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSImob, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls, Mask, wwdblook,
  mRegraDB, ComCtrls, wwdbdatetimepicker, wwdbedit, Wwdbspin ;

type
  TfrmCadTipoSuspensao = class(TfrmCadastroCSImob)
    Label1: TLabel;
    DBedtDescricao: TDBEdit;
    pgcParametros: TPageControl;
    tbsGeral: TTabSheet;
    tbsRegra: TTabSheet;
    chkSuspendeConcessao: TDBCheckBox;
    chkGeraParcela: TDBCheckBox;
    chkAtuSldParc: TDBCheckBox;
    chkCobraEncargo: TDBCheckBox;
    chkDeduzParcResta: TDBCheckBox;
    chkAtuSldEnvio: TDBCheckBox;
    molRegraDB4: TmolRegraDB;
    molRegraDB1: TmolRegraDB;
    molRegraDB2: TmolRegraDB;
    gbPeriodo: TGroupBox;
    Label4: TLabel;
    DBMeses: TwwDBSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtDataInicio: TwwDBDateTimePicker;
    edtDataFim: TwwDBDateTimePicker;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    cbSuspApenasConc: TDBCheckBox;
    edtPecentual: TDBEdit;
    Label5: TLabel;
    DBCheckBox4: TDBCheckBox;
    qryIDTIPOSUSPEMPTMO: TFloatField;
    qryTSEDESCRICAO: TStringField;
    qryTSEMESES: TFloatField;
    qryTSEINICIOSUSP: TDateTimeField;
    qryTSEFINALSUSP: TDateTimeField;
    qryIDRUBRICAADFERIAS: TFloatField;
    qryIDREGRAVALIDSUSP: TFloatField;
    qryIDREGRARECALCSEG: TFloatField;
    qryIDREGRARECALCIOF: TFloatField;
    qryIDREGRAENVIOPARC: TFloatField;
    qryFLGGERAPARCELAS: TFloatField;
    qryFLGATUALSALDOPARC: TFloatField;
    qryFLGSUSPCONCESSAO: TFloatField;
    qryFLGCOBRAENCARGOS: TFloatField;
    qryFLGDEDUZPARCREST: TFloatField;
    qryFLGATUALSALDOENV: TFloatField;
    qryFLGFERIAS: TFloatField;
    qryFLGCOBRJUDICIAL: TFloatField;
    qryFLGEMABERTO: TFloatField;
    qryFLGSUSAPENASCONC: TFloatField;
    qryPERCENTUAL: TFloatField;
    qryFLGENVIA: TFloatField;
    qryNOMEREGRAVALIDSUSP: TStringField;
    qryNOMEREGRARECALCSEG: TStringField;
    qryNOMEREGRARECALCIOF: TStringField;
    qryNOMEREGRAENVIOPARC: TStringField;
    molRegraDB5: TmolRegraDB;//SOL: 144458 Kintana: 1208325 Eraldo Silva
    molRegraDB6: TmolRegraDB;//SOL: 144458 Kintana: 1208325 Eraldo Silva
    molRegraDB3: TmolRegraDB;//SOL: 144458 Kintana: 1208325 Eraldo Silva
    qryTSEIDREGRACALCPRESTPROJETADA: TFloatField;//SOL: 144458 Kintana: 1208325 Eraldo Silva
    qryTSEIDREGRACALCULOMARGELATUAL: TFloatField;//SOL: 144458 Kintana: 1208325 Eraldo Silva
    qryNOMEREGRAPRESTPROJ: TStringField;//SOL: 144458 Kintana: 1208325 Eraldo Silva
    qryNOMEREGRAMARGCONSATU: TStringField;//SOL: 144458 Kintana: 1208325 Eraldo Silva
   //Rodrigo de Brito Figueredo SOL182431 Kintana 1700846 - inicio    
    dbrgTiposSuspensao: TDBRadioGroup;
    qryFLGSUSPENSAOITEM: TFloatField;
   //Rodrigo de Brito Figueredo SOL182431 Kintana 1700846 - fim

    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkAtuSldParcClick(Sender: TObject);
    procedure chkAtuSldEnvioClick(Sender: TObject);


  private { Private declarations }

   procedure Sel(const iTipoSuspensao: int64);
   procedure PreencheDefaults;
   procedure AbreQueries;
   function  VerificaPreenchimento: boolean;


  public  { Public declarations }


  end;



var
  frmCadTipoSuspensao: TfrmCadTipoSuspensao;



implementation
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UModulo, uFuncoesEmptmo, dLookEmptmo,
   UVerificaPreenchimento;



procedure TfrmCadTipoSuspensao.AbreQueries;
begin
   with dtmLookEmptmo.qryLookRubricaNormal do begin
      LimpaParametros(dtmLookEmptmo.qryLookRubricaNormal);
      ParamByName('PFLGDESCONTO').AsInteger := 1;
      Open;
   end;
end;



procedure TfrmCadTipoSuspensao.Sel(const iTipoSuspensao: int64);
begin
   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDTIPOSUSPEMPTMO').AsInteger  := iTipoSuspensao;
      Open;
   end;
end;



procedure TfrmCadTipoSuspensao.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   // habilita o painel de fundo (que contém o PageControl - orelhas)
   pnlFundo.Enabled := True;

   tbsGeral.Enabled   := False;
   tbsRegra.Enabled   := False;

   if CmeCadastro.Operacao in [opInserir, opAlterar] then
   begin
      tbsGeral.Enabled   := True;
      tbsRegra.Enabled   := True;
   end;
end;



procedure TfrmCadTipoSuspensao.CmeCadastroConfirma(Sender: TObject);
begin
   if (qry.State = dsInsert) then qryIDTIPOSUSPEMPTMO.asInteger := LeUltRegistro(nil, 'TIPOSUSPEMPTMO');

   CmeCadastro.RepetirInsert := False;
   inherited;
end;


procedure TfrmCadTipoSuspensao.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
   Accept := VerificaPreenchimento;
end;



procedure TfrmCadTipoSuspensao.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   PreencheDefaults;

   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadTipoSuspensao.CmeCadastroFind(Sender: TObject);
var
   iTipoSuspensao : int64;
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      iTipoSuspensao  := StrToInt(MontaSelect.ValoresChave[0]);

      Screen.Cursor  := crHourGlass;

      AbreQueries;

      Sel(iTipoSuspensao);

      Screen.Cursor  := crDefault;
   end;
end;



procedure TfrmCadTipoSuspensao.CmeCadastroInsert(Sender: TObject);
begin
   AbreQueries;

   Sel(-1);

   inherited;

   qry.FieldByName('FLGSUSPENSAOITEM').AsInteger := 0;//Rodrigo de Brito Figueredo SOL182431 Kintana 1700846

   PreencheDefaults;

   if DBedtDescricao.CanFocus then DBedtDescricao.SetFocus;
end;



procedure TfrmCadTipoSuspensao.FormShow(Sender: TObject);
begin
  inherited;

   pgcParametros.ActivePage := tbsGeral;
end;



procedure TfrmCadTipoSuspensao.PreencheDefaults;
begin
   if qry.State in dsEditModes then begin
      if qryFLGGERAPARCELAS.IsNull    then qryFLGGERAPARCELAS.AsInteger   := 0;
      if qryFLGATUALSALDOPARC.IsNull  then qryFLGATUALSALDOPARC.AsInteger := 1;
      if qryFLGSUSPCONCESSAO.IsNull   then qryFLGSUSPCONCESSAO.AsInteger  := 0;
      if qryFLGCOBRAENCARGOS.IsNull   then qryFLGCOBRAENCARGOS.AsInteger  := 0;
      if qryFLGDEDUZPARCREST.IsNull   then qryFLGDEDUZPARCREST.AsInteger  := 1;
      if qryFLGATUALSALDOENV.IsNUll   then qryFLGATUALSALDOENV.AsInteger  := 0;
      if qryFLGFERIAS.IsNUll          then qryFLGFERIAS.AsInteger         := 0;
      if qryFLGCOBRJUDICIAL.IsNull    then qryFLGCOBRJUDICIAL.AsInteger   := 0;

   // SOL108099 Daniel Begnami
      if qryFLGSUSAPENASCONC.IsNull   then qryFLGSUSAPENASCONC.AsInteger  := 0;

    end;
   if qry.State in [dsInsert] then
      edtPecentual.Text := '100';
   // Fim


   if qryFLGENVIA.IsNull   then qryFLGENVIA.AsInteger  := 0;  // SOL:122884 - Daniel Begnami   

end;



function  TfrmCadTipoSuspensao.VerificaPreenchimento: boolean;
begin
	Result := False;

	try

      if qryTSEDESCRICAO.isNULL then
         raise EValidacao.CreateVal('É necessário indicar a Descrição do Tipo de Suspensão!', DBedtDescricao);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmCadTipoSuspensao.chkAtuSldParcClick(Sender: TObject);
begin
  inherited;
  if qry.State in dsEditModes then begin
     if chkAtuSldParc.Checked then begin
        qry.FieldByName('FLGATUALSALDOENV').AsInteger  := 0;
        qry.FieldByName('FLGATUALSALDOPARC').AsInteger := 1;
     end else begin
        qry.FieldByName('FLGATUALSALDOENV').AsInteger  := 1;
        qry.FieldByName('FLGATUALSALDOPARC').AsInteger := 0;
     end;
  end;
end;



procedure TfrmCadTipoSuspensao.chkAtuSldEnvioClick(Sender: TObject);
begin
  inherited;
  if qry.State in dsEditModes then begin
     if chkAtuSldEnvio.Checked then begin
        qry.FieldByName('FLGATUALSALDOENV').AsInteger  := 1;
        qry.FieldByName('FLGATUALSALDOPARC').AsInteger := 0;
     end else begin
        qry.FieldByName('FLGATUALSALDOENV').AsInteger  := 0;
        qry.FieldByName('FLGATUALSALDOPARC').AsInteger := 1;
     end;
  end;
end;


end.
