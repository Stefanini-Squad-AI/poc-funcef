unit FAnaliseGeracaoContasOrcamen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBClient, wwclient,
  StdCtrls, DBTables, Wwquery;

type
  TFrmAnaliseGeracaoContasOrcamen = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cdsCodigos: TwwClientDataSet;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    chkGO: TCheckBox;
    chkCC: TCheckBox;
    chkAP: TCheckBox;
    chkPP: TCheckBox;
    chkPT: TCheckBox;
    chkCR: TCheckBox;
    chkPR: TCheckBox;
    chkTD: TCheckBox;
    dsCodigos: TDataSource;
    edtCodGrupo: TEdit;
    Label1: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid3: TwwDBGrid;
    qryContOrcamenFaltante: TwwQuery;
    dsContOrcamenFaltante: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
    procedure Inicia;
  public
    { Public declarations }

    
  end;

var
  FrmAnaliseGeracaoContasOrcamen: TFrmAnaliseGeracaoContasOrcamen;

implementation

{$R *.DFM}

procedure TFrmAnaliseGeracaoContasOrcamen.FormShow(Sender: TObject);
begin
     if cdsCodigos.Active then
     begin
          StatusBar1.panels[0].Text := 'Total de registros ' + IntToStr(cdsCodigos.recordcount);
     end;

     Inicia;

end;

procedure TFrmAnaliseGeracaoContasOrcamen.Inicia;
var
 SSql:string;
 ListSQL:TStringList;
begin
      if cdsCodigos.Recordcount > 0 then
      begin

           ListSQL := TStringList.Create;
           SSql    := ' SELECT C.* FROM CONTASORCAMEN C JOIN GRUPOORCAMEN G ' +
                      ' ON G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN ' +
                      ' WHERE G.CODGRUPOORC =  ' + QuotedStr(edtCodGrupo.text) +
                      ' AND IDCONTAORCAMEN NOT IN ( ';

           cdsCodigos.First;
           While not cdsCodigos.eof Do
           begin

                ListSQL.Add(QuotedStr(cdsCodigos.fieldbyname('CODIGO').AsString) + ',');
                cdsCodigos.Next;
           end;

           cdsCodigos.First;
           SSql := SSql + ListSQL.Text +  QuotedStr('XXX') +  ') ORDER BY IDCONTAORCAMEN';
           qryContOrcamenFaltante.Close;
           qryContOrcamenFaltante.Sql.Clear;
           qryContOrcamenFaltante.Sql.Text := sSQL;
           qryContOrcamenFaltante.Active   := true;
           StatusBar1.panels[1].Text := 'Total de contas de grupo não gerado: ' + IntToStr(qryContOrcamenFaltante.recordcount);

           FreeAndNil(ListSQL);

      end;
end;

procedure TFrmAnaliseGeracaoContasOrcamen.wwDBGrid1TitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
     if not cdsCodigos.Active then
        cdsCodigos.IndexFieldNames := AFieldName;

end;

end.
