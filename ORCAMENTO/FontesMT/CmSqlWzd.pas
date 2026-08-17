unit CmSqlWzd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TCmExportWzd = class
  public
    Function Executar: Boolean;
End;

type
  TCmDataDic = class
  public
    Procedure Executar;
End;

Const
  DataBaseName = 'BaseDados';

type
  TCmSqlWzd = class
  private
    { Private declarations }
    FNomeSql: String;
    FGravaNoBanco, FExibeSql: Boolean;
    FSql, FDescSql: TStrings;
    FDataDic: TCmDataDic;
    FExportWzd: TCmExportWzd;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create;    
    Destructor Destroy; Override;
    Property Sql: TStrings Read FSql Write FSql;
    Property NomeSql: String Read FNomeSql Write FNomeSql;
    Property DescSql: TStrings Read FDescSql Write FDescSql;
    Property DataDic: TCmDataDic read FDataDic write FDataDic;
    Property ExportWzd: TCmExportWzd read FExportWzd write FExportWzd;
    Function Executar: Boolean;
    Property GravaNoBanco: Boolean Read FGravaNoBanco Write FGravaNoBanco;
    Property ExibeSql: Boolean Read FExibeSql Write FExibeSql;
  end;

Var
  SqlWzd: TCmSqlWzd;

implementation

Uses Asistente, FDataDic, FAguardeDDic, AssistenteExpot;

constructor TCmSqlWzd.Create;
Begin
  Inherited Create;
  FSql          := TStringList.Create;
  FDescSql      := TStringList.Create;
  FGravaNoBanco := True;
  FExibeSql     := True;
End;

Destructor TCmSqlWzd.Destroy;
Begin
  FDescSql.Free;
  FSql.Free;
  Inherited Destroy;
End;

Function TCmSqlWzd.Executar: Boolean;
Begin
  Try
   Application.CreateForm(TFrmAssistente,FrmAssistente);
   If FGravaNoBanco And Not FExibeSql Then
   Begin
      FrmAssistente.TbsGrava.Parent := FrmAssistente.PnlFinal;
      FrmAssistente.MemSql.Parent   := FrmAssistente.TbsSql;
   End
   Else
      If Not FGravaNoBanco And FExibeSql Then
      Begin
         FrmAssistente.MemSql.Parent   := FrmAssistente.PnlFinal;
         FrmAssistente.TbsGrava.Parent := FrmAssistente.PageFinal;
      End
      Else
      Begin
         FrmAssistente.TbsGrava.Parent := FrmAssistente.PageFinal;
         FrmAssistente.MemSql.Parent   := FrmAssistente.TbsSql;
      End;

   FrmAssistente.PageFinal.Visible := (FGravaNoBanco And FExibeSql);

   FSql.Clear;
   FDescSql.Clear;
   FNomeSql := '';

   FrmAssistente.MemSql.Clear;
   FrmAssistente.MenDescSql.Clear;
   FrmAssistente.EdtNomeCons.Text := '';
   FrmAssistente.CkbGrupo.Checked := False;
   FrmAssistente.CkbGrupoClick(Self);

   If (FrmAssistente.ShowModal = MrOK) Then
   Begin
      FSql.Text     := FrmAssistente.MemSql.Lines.Text;
      FDescSql.Text := FrmAssistente.MenDescSql.Lines.Text;
      FNomeSql      := FrmAssistente.EdtNomeCons.Text;
   End;

  Finally
   Result := (FSql.Count <> 0);
   FrmAssistente.Free;
  End;
End;

Procedure TCmDataDic.Executar;
Begin
  FrmDataDic.ShowModal;
End;

Function TCmExportWzd.Executar: Boolean;
Begin
  Try
   Application.CreateForm(TFrmAssistenteExport,FrmAssistenteExport);
   Result := (FrmAssistenteExport.ShowModal = MrOK)
  Finally
   FrmAssistenteExport.Free;
  End;
End;

end.

