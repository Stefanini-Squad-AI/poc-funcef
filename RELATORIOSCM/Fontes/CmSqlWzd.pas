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

Uses FDataDicMT, fAssistenteConsultasMT, FAguardeDDic,
     fAssistenteExportaMT;

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
     Application.CreateForm( TFrmAssistenteConsultas, FrmAssistenteConsultas );

     If FGravaNoBanco And ( Not FExibeSql ) Then Begin
        FrmAssistenteConsultas.TbsGrava.Parent := FrmAssistenteConsultas.PnlFinal;
        FrmAssistenteConsultas.MemSql.Parent   := FrmAssistenteConsultas.TbsSql;
     End Else
        If ( Not FGravaNoBanco ) And FExibeSql Then Begin
           FrmAssistenteConsultas.MemSql.Parent   := FrmAssistenteConsultas.PnlFinal;
           FrmAssistenteConsultas.TbsGrava.Parent := FrmAssistenteConsultas.PageFinal;
        End Else Begin
           FrmAssistenteConsultas.TbsGrava.Parent := FrmAssistenteConsultas.PageFinal;
           FrmAssistenteConsultas.MemSql.Parent   := FrmAssistenteConsultas.TbsSql;
        End;

     FrmAssistenteConsultas.PageFinal.Visible := ( FGravaNoBanco And FExibeSql );

     FSql.Clear;
     FDescSql.Clear;
     FNomeSql := '';

     FrmAssistenteConsultas.MemSql.Clear;
     FrmAssistenteConsultas.MenDescSql.Clear;
     FrmAssistenteConsultas.EdtNomeCons.Text := '';
     FrmAssistenteConsultas.CkbGrupo.Checked := False;
     FrmAssistenteConsultas.CkbGrupoClick( Self );

     If FrmAssistenteConsultas.ShowModal = MrOK Then Begin
        FSql.Text     := FrmAssistenteConsultas.MemSql.Lines.Text;
        FDescSql.Text := FrmAssistenteConsultas.MenDescSql.Lines.Text;
        FNomeSql      := FrmAssistenteConsultas.EdtNomeCons.Text;
     End;
  Finally
     Result := ( FSql.Count <> 0 );
     FrmAssistenteConsultas.Free;
  End;
End;

Procedure TCmDataDic.Executar;
Begin
  FrmDataDic.ShowModal;
End;

Function TCmExportWzd.Executar: Boolean;
Begin
  Try
     Application.CreateForm( TFrmAssistenteExport, FrmAssistenteExport );
     Result := ( FrmAssistenteExport.ShowModal = MrOK )
  Finally
     FrmAssistenteExport.Free;
  End;

End;

end.

