unit fAssociacaoGruposCampos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, DBCtrls, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, MontaSelect, uMensErro;

type
  TfrmAssociacaoGruposCampos = class(TfrmSairAjuda)
    Qry: TwwQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    dblkpVariaveis: TDBLookupListBox;
    ds: TwwDataSource;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Splitter1: TSplitter;
    Panel7: TPanel;
    Panel8: TPanel;
    QrySel: TwwQuery;
    dsSel: TwwDataSource;
    QryDisp: TwwQuery;
    dsDisp: TwwDataSource;
    Panel9: TPanel;
    Panel10: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    QryAux: TwwQuery;
    BitBtn1: TBitBtn;
    ms: TMontaSelect;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    BitBtn2: TBitBtn;
    ms1: TMontaSelect;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    Procedure AbrirQry;
    procedure SpeedButton4Click(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAssociacaoGruposCampos: TfrmAssociacaoGruposCampos;

implementation

uses fAguarde;

{$R *.DFM}

procedure TfrmAssociacaoGruposCampos.FormShow(Sender: TObject);
begin
  inherited;
  Qry.Close;
  Qry.Open;
end;

procedure TfrmAssociacaoGruposCampos.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Excluindo Campo ...');
  frmAguarde.Refresh;
  with QryAux do begin
       Close;
       Sql.Clear;
       Sql.Add( 'DELETE CMPBDGRP WHERE IDCAMPO ='''+QrySel.FieldbyName('IDCAMPO').AsString+
                ''' AND CODGRUPOARQUIVO = '''+QrySel.FieldbyName('CODGRUPOARQUIVO').AsString+'''');
       ExecSql;
  end;
  AbrirQry;
end;


Procedure TfrmAssociacaoGruposCampos.AbrirQry;
begin
  frmAguarde.Mostra('Selecionando Dados ...');
  frmAguarde.Refresh;

  with QrySel do begin
       Close;
       Sql.Clear;
       Sql.Add( 'SELECT G.CODGRUPOARQUIVO, C.IDCAMPO, C.DESCRICAODOCAMPO, '+
                '(C.IDCAMPO||'' - ''||C.DESCRICAODOCAMPO) DESCR FROM CMPBDGRP G, CMPBD C '+
                'WHERE (G.IDCAMPO = C.IDCAMPO) AND (G.CODGRUPOARQUIVO = '''+
                Qry.FieldbyName('CODGRUPOARQUIVO').AsString+''') ORDER BY G.IDCAMPO');
       Open;
  end;
  with QryDisp do begin
       Close;
       Sql.Clear;
       Sql.Add( 'SELECT C.IDCAMPO, C.DESCRICAODOCAMPO, C.ENTIDADE TABELA, C.NOMEDOCAMPO CAMPO, '+
                'C.IDCAMPO||'' - ''||C.DESCRICAODOCAMPO DESCR FROM CMPBD C WHERE (C.CAMPODOBANCO > 0) '+
                'AND (C.IDCAMPO NOT IN (SELECT C.IDCAMPO FROM CMPBDGRP G, CMPBD C WHERE (G.IDCAMPO = C.IDCAMPO) AND '+
                '(G.CODGRUPOARQUIVO = '''+Qry.FieldbyName('CODGRUPOARQUIVO').AsString+
                '''))) ORDER BY C.IDCAMPO');
       Open;
  end;
  frmAguarde.Apaga;
end;

procedure TfrmAssociacaoGruposCampos.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Incluindo Campo ...');
  frmAguarde.Refresh;
  with QryAux do begin
       Close;
       Sql.Clear;
       Sql.Add( 'INSERT INTO CMPBDGRP (IDCAMPO, CODGRUPOARQUIVO) VALUES ('+
                ''''+QryDisp.FieldbyName('IDCAMPO').AsString+''','''+Qry.FieldbyName('CODGRUPOARQUIVO').AsString+''')');
       ExecSql;
  end;
  AbrirQry;
end;

procedure TfrmAssociacaoGruposCampos.dsDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  AbrirQry;
end;

procedure TfrmAssociacaoGruposCampos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  QrySel.DisableControls;
  frmAguarde.Mostra('Fazendo Filtro ...');
  frmAguarde.Refresh;
  ms.Filtro.Clear;
  ms.Filtro.Add('CMPBD.CAMPODOBANCO > 0');
  QrySel.First;
  while not QrySel.Eof do begin
        ms.Filtro.Add('CMPBD.IDCAMPO <> '''+QrySel.FieldbyName('IDCAMPO').AsString+'''');
        QrySel.Next;
  end;
  QrySel.EnableControls;
  frmAguarde.Apaga;
  ms.Executar;
  frmAguarde.Mostra('Procurando Campo ...');
  frmAguarde.Refresh;
  if ms.RetornouValor then
     QryDisp.Locate('IDCAMPO', ms.ValoresChave[0],[]);
  frmAguarde.Apaga;
end;

procedure TfrmAssociacaoGruposCampos.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ms1.Filtro.Clear;
  ms1.Filtro.Add('CMPBD.IDCAMPO = CMPBDGRP.IDCAMPO');
  ms1.Filtro.Add('CMPBDGRP.CODGRUPOARQUIVO = '''+Qry.FieldbyName('CODGRUPOARQUIVO').AsString+'''');
  ms1.Executar;
  frmAguarde.Mostra('Procurando Campo ...');
  frmAguarde.Refresh;
  if ms1.RetornouValor then
     QrySel.Locate('IDCAMPO', ms1.ValoresChave[0],[]);
  frmAguarde.Apaga;
end;

end.
