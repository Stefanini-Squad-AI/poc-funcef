unit FCadHistoricos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, DBCtrls, CmEventosCadastro, ImgList;

type
  TFrmCadHistoricos = class(TfrmCadastroCS)
    qryIDHISTORICOSAF: TFloatField;
    qryDESCHISTORICOSAF: TStringField;
    qryRECPAG: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    EdtSaf: TwwDBEdit;
    EdtHistorico: TwwDBEdit;
    GpbSistema: TDBRadioGroup;
    BtnImporta: TToolbarButton97;
    OpFile: TOpenDialog;
    qryFLGBLOQUEADO: TStringField;
    CkbBloqueado: TDBCheckBox;
    Bevel1: TBevel;
    procedure BtnImportaClick(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadHistoricos: TFrmCadHistoricos;

implementation

Uses fAguarde, UDataBase, uCMTypes;

{$R *.DFM}

Procedure TFrmCadHistoricos.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
  Accept := (EdtSaf.Text <> '');
  If Not Accept Then
     Application.MessageBox('Código do SAF não informado','Importação SAF',Mb_IconInformation)
  Else
  Begin
     Accept := (EdtHistorico.Text <> '');

     If Not Accept Then
        Application.MessageBox('Histórico do SAF não informado','Importação SAF',Mb_IconInformation)
     Else
     Begin
       Accept := (GpbSistema.ItemIndex > -1);

       If Not Accept Then
          Application.MessageBox('Sistema Não Informado','Importação SAF',Mb_IconInformation);
     End;
  End;
End;

Procedure TFrmCadHistoricos.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If MontaSelect.RetornouValor Then
   Begin
      Qry.Close;
      If Not Qry.Prepared Then Qry.Prepare;
      Qry.Params[0].Asfloat := StrToInt(MontaSelect.ValoresChave[0]);
      Qry.Open;
   End;
End;

procedure TFrmCadHistoricos.BtnImportaClick(Sender: TObject);
Var
  T :TextFile;
  X, ContRegImp :Integer;
  Linha, Campo:String;
begin
  inherited;
  sbtnProcurar.Down := False;
  If (Not (CmeCadastro.Operacao In [OpInserir,OpAlterar])) And
     OpFile.Execute Then
  Begin
     AssignFile(T,OpFile.FileName);
     Reset(T);

     Try
        FrmAguarde.Min := 0;
        FrmAguarde.Max := 1000;
        ContRegImp := 0;

        While Not Eof(T) Do
        Begin
          FrmAguarde.Mostra('Importando Históricos...');
          FrmAguarde.Pos := FrmAguarde.Pos + 1;
          Application.ProcessMessages;

          ReadLn(T,Linha);

          Campo := Copy(Linha,1,Pos('^',Linha)-1);
          Linha := Copy(Linha,Pos('^',Linha) + 1,Length(Linha));

          Qry.Close;
          If Not Qry.Prepared Then Qry.Prepare;
          Qry.Params[0].Asfloat := StrToIntDef(Campo,0);
          Qry.Open;

          If (Qry.Params[0].Asfloat > 0) And (Qry.IsEmpty) Then
          Begin
             Qry.Append;
             For X:=0 To 2 Do
             Begin
                 Qry.Fields[x].AsString := Campo;

                 Campo := Copy(Linha,1,Pos('^',Linha)-1);
                 Linha := Copy(Linha,Pos('^',Linha) + 1,Length(Linha));
             End;
             Qry.Post;
             AplicaAlteracoes([Qry]);
             Inc(ContRegImp);
          End;
        End;
        FrmAguarde.Apaga;
        Application.MessageBox(Pchar(IntToStr(ContRegImp) + ' Registro(s) Importado(s)'),'Importação SAF',Mb_IconInformation);
     Finally
       FrmAguarde.Apaga;
       CloseFile(T);
     End;
  End;
end;

procedure TFrmCadHistoricos.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qryFLGBLOQUEADO.AsString := 'N';
end;

end.
