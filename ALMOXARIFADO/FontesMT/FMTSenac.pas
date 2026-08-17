unit FMTSenac;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery,
  Grids, DBGrids, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  uCmSqlParams, DBClient, uCMClientDataSet, uCtrlAlmox;

type
      TSenac = Record
         SNA_ENT_002  : String[01];
         SNA_NCT_004  : String[13];
         SNA_UOR_006  : String[03];  
         SNA_MDA_008  : String[03];
         SNA_SMA_010  : String[03];  
         SNA_COD_012  : String[02];
         SNA_MESPRO   : String[02];
         SNA_DIAPRO   : String[02];
         SNA_SEQDIA   : String[02];
         SNA_VA1_024  : String[15];
         SNA_VA2_026  : String[15];
         SNA_NOL_028  : String[11];
         SNA_SIG_030  : String[02];
         SNA_CAR_030  : String[09];
         SNA_UOD_032  : String[03];
         SNA_MES_034  : String[02];
         SNA_DIA_034  : String[02];
         SNA_NHI_036  : String[03];
         SNA_HIS_038  : String[40];
         SNA_NUM_040  : String[03];
         SNA_MES_040  : String[02];
         SNA_SEQ_042  : String[05];
         BRANCO1      : String[01];
         SNA_MOVMOD   : String[02];
         BRANCO2      : String[02];
         SNA_ASTER    : String[01];
      End;
  TFrmMTSenac = class(TfrmSairAjuda)
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    plnProc: TPanel;
    pgbar: TProgressBar;
    edNumOL: TEdit;
    Label3: TLabel;
    btnGravaArq: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    btnGrava: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    Dlg: TSaveDialog;
    dblcAlmox: TwwDBLookupCombo;
    Label4: TLabel;
    CdsMov: TCMClientDataSet;
    spMov: TCMSqlParams;
    CdsAlmox: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnGravaArqClick(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
      Almox     : TCtrlAlmox;
      Senac     : TSenac;
      re        : TStrings;
      sCentCust : String;
      //
      Procedure GravaReg( Tipo : String; Op : Char; ContaContab : String; Cont : Integer );
      Procedure GeraArq;
  public
    { Public declarations }
  end;

var
  FrmMTSenac: TFrmMTSenac;


implementation

{$R *.DFM}
Uses uString, uMEnsErro, uSistema, uModulo, Mask, DBaseDados;


Procedure TFrmMTSenac.GravaReg( Tipo : String; Op : Char; ContaContab : String; Cont : Integer );
begin
  // ========================================================================
  //  Constantes do Arquivo
  // ========================================================================
   Senac.SNA_ENT_002 := '2';
   Senac.SNA_NCT_004 :=  Espaco(ContaContab,13);
   Senac.SNA_COD_012 := '30';
   Senac.SNA_MESPRO  := FormatDateTime('MM',Date);
   Senac.SNA_DIAPRO  := FormatDateTime('DD',Date);
   Senac.SNA_SEQDIA  := '01';
   Senac.SNA_MES_034 := FormatDateTime('MM',EdDataF.Date);
   Senac.SNA_DIA_034 := FormatDateTime('DD',EdDataF.Date);
   Senac.SNA_NUM_040 := '980';
   Senac.SNA_MES_040 := FormatDateTime('MM',EdDataF.Date);
   Senac.BRANCO1     := ' ';
   Senac.SNA_MOVMOD  := 'ES';
   Senac.BRANCO2     := '  ';
   Senac.SNA_ASTER   := '*';
   Senac.SNA_HIS_038 := Espaco(' ',40);
   Senac.SNA_UOR_006 := '066';
   Senac.SNA_MDA_008 := '000';
   Senac.SNA_SMA_010 := '000';
   Senac.SNA_UOD_032 := '066';
   Senac.SNA_NOL_028 := ZD(Trim(edNumOL.Text),11);
   Senac.SNA_SEQ_042 := ZD(IntToStr(Cont),5);
   Senac.SNA_CAR_030 := ZD(CdsMov.FieldByName('DOC').AsString,9);

  // ========================================================================
  //  Movimento de Entrada
  // ========================================================================

  If Tipo = 'NF' Then
     Begin
        Senac.SNA_SIG_030 := 'NF';
        Senac.SNA_NHI_036 := '097';
        If CdsMov.FieldByName('TIPO').AsString = 'R' Then
           Begin
              Case Op Of
                 'C' : Begin //Crédito
                         // Formação da Conta = 5 digitos da conta contabil + 6 da sub-Conta
                          Senac.SNA_NCT_004 := Copy(Senac.SNA_NCT_004,1,5)+ ZD(Copy(CdsMov.FieldByName('CODSUBCONTA').AsString,1,6),6);
                          Senac.SNA_NCT_004 := Espaco(Senac.SNA_NCT_004,13);
                          //
                          Senac.SNA_VA1_024 := '0';
                          Senac.SNA_VA2_026 := CdsMov.FieldByName('VALOR').asString;
                       End;
                 'D' : Begin //Débito
                          Senac.SNA_VA1_024 := CdsMov.FieldByName('VALOR').asString;
                          Senac.SNA_VA2_026 := '0';
                       End;
              End;
           End
        Else
        If CdsMov.FieldByName('TIPO').AsString = 'D' Then
           Begin
              Case Op Of
                 'C' : Begin //Crédito
                          Senac.SNA_VA1_024 := '0';
                          Senac.SNA_VA2_026 := CdsMov.FieldByName('VALOR').asString;
                       End;
                 'D' : Begin //Débito
                         // Formação da Conta = 5 digitos da conta contabil + 6 da sub-Conta
                          Senac.SNA_NCT_004 := Copy(Senac.SNA_NCT_004,1,5)+ ZD(Copy(CdsMov.FieldByName('CODSUBCONTA').AsString,1,6),6);
                          Senac.SNA_NCT_004 := Espaco(Senac.SNA_NCT_004,13);
                         //
                          Senac.SNA_VA1_024 := CdsMov.FieldByName('VALOR').asString;
                          Senac.SNA_VA2_026 := '0';
                       End;
              End;
           End;
     End
  Else
  If Tipo = 'ST' Then
     Begin
        Senac.SNA_SIG_030 := 'ST';
        Senac.SNA_NHI_036 := '098';
        Case Op Of
           'C' : Begin //Crédito
                    If CdsMov.FieldByName('DEVOLUCAO').AsString <> 'N' Then
                       Begin
                          sCentCust := ZD(sCentCust,9);
                          Senac.SNA_UOR_006 := Copy(sCentCust,1,3);
                          Senac.SNA_MDA_008 := Copy(sCentCust,4,3);
                          Senac.SNA_SMA_010 := Copy(sCentCust,7,3);
                          Senac.SNA_UOD_032 := Copy(sCentCust,1,3);
                       End;
                    Senac.SNA_VA1_024 := '0';
                    Senac.SNA_VA2_026 := CdsMov.FieldByName('VALOR').asString;
                 End;
           'D' : Begin //Débito
                    If CdsMov.FieldByName('DEVOLUCAO').AsString = 'N' Then
                       Begin
                          sCentCust := ZD(sCentCust,9);
                          Senac.SNA_UOR_006 := Copy(sCentCust,1,3);
                          Senac.SNA_MDA_008 := Copy(sCentCust,4,3);
                          Senac.SNA_SMA_010 := Copy(sCentCust,7,3);
                          Senac.SNA_UOD_032 := Copy(sCentCust,1,3);
                       End;
                    //
                    Senac.SNA_VA1_024 := CdsMov.FieldByName('VALOR').asString;
                    Senac.SNA_VA2_026 := '0';
                 End;
        End;
     End;
     Senac.SNA_VA1_024 := ZD(Senac.SNA_VA1_024,15);
     Senac.SNA_VA2_026 := ZD(Senac.SNA_VA2_026,15);
// Grava linha do Registro
     re.Add(
     Senac.SNA_ENT_002+
     Senac.SNA_NCT_004+
     Senac.SNA_UOR_006+
     Senac.SNA_MDA_008+
     Senac.SNA_SMA_010+
     Senac.SNA_COD_012+
     Senac.SNA_MESPRO +
     Senac.SNA_DIAPRO +
     Senac.SNA_SEQDIA +
     Senac.SNA_VA1_024+
     Senac.SNA_VA2_026+
     Senac.SNA_NOL_028+
     Senac.SNA_SIG_030+
     Senac.SNA_CAR_030+
     Senac.SNA_UOD_032+
     Senac.SNA_MES_034+
     Senac.SNA_DIA_034+
     Senac.SNA_NHI_036+
     Senac.SNA_HIS_038+
     Senac.SNA_NUM_040+
     Senac.SNA_MES_040+
     Senac.SNA_SEQ_042+
     Senac.BRANCO1    +
     Senac.SNA_MOVMOD +
     Senac.BRANCO2    +
     Senac.SNA_ASTER  );
end;

Procedure TFrmMTSenac.GeraArq;
Var
    x,j     : Integer;
    sCCEnt  : String;
    sCCSai  : String;
begin
   spMov.Prepare;

   spMov.ParamByName('DATAI').AsDateTime          := edDataI.Date;
   spMov.ParamByName('DATAF').AsDateTime          := edDataF.Date;
   spMov.ParamByName('IDPESSOA').asInteger        := Sistema.IdEmpresa;
   spMov.ParamByName('CODALMOXARIFADO').asInteger := StrToInt(dblcAlmox.LookupValue);

   spMov.Open;

   x := 0;
   plnProc.Visible := True;
   pgbar.Position  := x;
   pgbar.Min       := x;
   pgbar.Max       := CdsMov.RecordCount;
   re.Clear;
   CdsMov.First;
   While Not CdsMov.EOF Do
      Begin
         Inc(x);
         If CdsMov.FieldByName('INDENT').AsString = 'NF' Then
            Begin
               //Verifica se Entrada/Devolução de mercadoria
               If CdsMov.FieldByName('DEVOLUCAO').AsString = 'N' Then
                 Begin// Entrada de Mercadoria
                    GravaReg(CdsMov.FieldByName('INDENT').AsString,'C',CdsMov.FieldByName('CONTA').AsString,x);
                    Inc(x);
                    GravaReg(CdsMov.FieldByName('INDENT').AsString,'D','112620110',x);
                 End
               Else
                 Begin // Devolução de Mercadoria
                    GravaReg(CdsMov.FieldByName('INDENT').AsString,'D',CdsMov.FieldByName('CONTA').AsString,x);
                    Inc(x);
                    GravaReg(CdsMov.FieldByName('INDENT').AsString,'C','112620110',x);
                 End
            End
         Else
            Begin
               Modulo.LeContaContabil(CdsMov.FieldByName('CODARTIGO').AsString,'',sCCEnt,sCCSai,j);
               sCentCust := CdsMov.FieldByName('CODCENTROCUSTO').asString;
               // Verifica se é baixa ou e devolução
               If CdsMov.FieldByName('DEVOLUCAO').AsString = 'N' Then
                  Begin // baixa
                     GravaReg(CdsMov.FieldByName('INDENT').AsString,'C','112620110',x);
                     Inc(x);
                     GravaReg(CdsMov.FieldByName('INDENT').AsString,'D',sCCSai,x);
                  End
               Else
                  Begin // devolução
                     GravaReg(CdsMov.FieldByName('INDENT').AsString,'D','112620110',x);
                     Inc(x);
                     GravaReg(CdsMov.FieldByName('INDENT').AsString,'C',sCCSai,x);
                  End

            End;
         CdsMov.Next;
         pgbar.Position := x;
         Application.ProcessMessages;
      End;
   plnProc.Visible := False;
end;

procedure TFrmMTSenac.FormCreate(Sender: TObject);
begin
  inherited;
  edDataI.Date := Date;
  edDataF.Date := Date;
  //
  Almox := TCtrlAlmox.Create;
  Almox.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsAlmox.Data := Almox.ListAlmox(Sistema.IdEmpresa);
  //
  re := TStringList.Create;
end;

procedure TFrmMTSenac.btnGravaArqClick(Sender: TObject);
begin
  inherited;
  If Trim(edDataI.Text) = '' Then
     Begin
        MsgDlg('Data de Início não preenchido','Erro',mtError,[mbOk],0 );
        edDataI.SetFocus;
        ModalResult := mrNone;
     End
  Else
  If Trim(edDataF.Text) = '' Then
     Begin
        MsgDlg('Data final não preenchido','Erro',mtError,[mbOk],0 );
        edDataI.SetFocus;
     End
  Else
  If (edDataI.Date  > edDataF.Date ) Then
     Begin
        MsgDlg('Data de inicio não pode ser maior que a data final','Erro',mtError,[mbOk],0 );
        edDataI.SetFocus;
     End
  Else
  if Trim(dblcAlmox.Text) = '' Then
     Begin
        MsgDlg('Obrigatorio preencher o Almoxarifado','Erro',mtError,[mbOk],0 );
        dblcAlmox.SetFocus;
     End
  Else
    Begin
       GeraArq;
       MsgDlg('Arquvio Gerado com sucesso','Informação',mtInformation,[mbOk],0 );
       btnGrava.Click;
    End;
end;

procedure TFrmMTSenac.btnGravaClick(Sender: TObject);
begin
  inherited;
  If Dlg.Execute Then
     re.SaveToFile(Dlg.FileName);
end;

procedure TFrmMTSenac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  re.Free;
  Almox.Free;
  
  inherited;
end;

end.


