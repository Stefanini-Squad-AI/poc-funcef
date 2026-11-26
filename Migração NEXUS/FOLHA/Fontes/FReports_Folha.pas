unit FReports_Folha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Spin, StdCtrls, wwdblook, ExtCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Db, Wwdatsrc, DBTables,
  Wwquery;

type
  TFrmReports_Folha = class(TfrmOkCancelar)
    RdoTipoFolha: TRadioGroup;
    RdoTipoFiltro: TRadioGroup;
    PnlPreviaouEfetivada: TPanel;
    PnlMesPagto: TPanel;
    LblMesPagto: TLabel;
    CmbMes: TComboBox;
    PnlLoteouVersao: TPanel;
    LblLoteouVersao: TLabel;
    qryPreviaouEfetivada: TwwQuery;
    dsPreviaouEfetivada: TwwDataSource;
    SpnedAno: TSpinEdit;
    dblkLoteouVersao: TwwDBLookupCombo;
    procedure RdoTipoFolhaClick(Sender: TObject);
    procedure RdoTipoFiltroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    { Protected declarations }

  private
    { Private declarations }
    sTabela : String;

  public
    { Public declarations }
    wDia, wMes, wAno : Word;
    sSql : String;

  published
    { Published declarations }
    property Tabela : String read sTabela write sTabela;

  end;

var
  FrmReports_Folha: TFrmReports_Folha;

implementation

Uses
  UMensErro, uAdmPrevFB, fAguarde;

{$R *.DFM}

procedure TFrmReports_Folha.RdoTipoFolhaClick(Sender: TObject);
begin
  inherited;
  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    RdoTipoFiltro.Items.Strings[0] := 'Por Lote';
    LblLoteouVersao.Caption        := 'Lote';
    sSql := ' SELECT IDLOTE, MESREFERENCIA, IDLOTE||'' - ''||DESCRICAO AS DESCRICAO '+
            ' FROM CTRLINTERFACE '+
            ' WHERE FLGPREPARADO = 1 '+
            ' AND TIPO = ''B'' '+
            ' AND IDPESSOA = '+inttostr(iidfundacao)+' '+
            ' AND FLGVOLTATMP = 0 '+
            ' ORDER BY IDLOTE DESC';
    qryPreviaouEfetivada.Close;
    qryPreviaouEfetivada.SQL.Clear;
    qryPreviaouEfetivada.SQL.Add(sSql);
    dblkLoteouVersao.LookupField := '';
    dblkLoteouVersao.LookupField := 'IDLOTE';
    qryPreviaouEfetivada.Open;
    dblkLoteouVersao.Selected.add('DESCRICAO'+#9+'40'+#9+'Lote');
    dblkLoteouVersao.Refresh;
    sTabela := 'PREVIA';
  End
  Else
  Begin
    RdoTipoFiltro.Items.Strings[0] := 'Por Versão';
    LblLoteouVersao.Caption        := 'Versão';
    sSql := ' SELECT IDHSTFOLHABENEF, IDHSTFOLHABENEF||'' - ''||HISTORICO AS DESCRICAO '+
            ' FROM HSTFOLHABENEF '+
            ' WHERE '+
            ' IDFUNDACAO = '+inttostr(iidfundacao)+' '+
            ' ORDER BY IDHSTFOLHABENEF DESC ';
    qryPreviaouEfetivada.Close;
    qryPreviaouEfetivada.SQL.Clear;
    qryPreviaouEfetivada.SQL.Add(sSql);
    dblkLoteouVersao.LookupField := '';
    dblkLoteouVersao.LookupField := 'IDHSTFOLHABENEF';
    qryPreviaouEfetivada.Open;
    dblkLoteouVersao.Selected.add('DESCRICAO'+#9+'40'+#9+'Versão');
    dblkLoteouVersao.Refresh;
    sTabela := 'HISTRUBSAL';
  End;
end;

procedure TFrmReports_Folha.RdoTipoFiltroClick(Sender: TObject);
begin
  inherited;
  If RdoTipoFiltro.ItemIndex = 0 Then
  Begin
    CmbMes.ItemIndex             := -1;
    SpnedAno.Value               := 0;
    LblLoteouVersao.Enabled      := True;
    PnlPreviaouEfetivada.Enabled := True;
    PnlLoteouVersao.Enabled      := True;
    PnlMesPagto.Enabled          := False;
    LblMesPagto.Enabled          := False;
  End
  Else
  Begin
    dblkLoteouVersao.Text        := '';
    LblMesPagto.Enabled          := True;
    PnlPreviaouEfetivada.Enabled := True;
    PnlLoteouVersao.Enabled      := False;
    PnlMesPagto.Enabled          := True;
    LblLoteouVersao.Enabled      := False;
    CmbMes.ItemIndex             := wMes - 1;
    SpnedAno.Value               := wAno;
  End;
end;

procedure TFrmReports_Folha.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    RdoTipoFiltro.Items.Strings[0] := 'Por Lote';
    LblLoteouVersao.Caption        := 'Lote';
    sSql := ' SELECT IDLOTE, MESREFERENCIA, IDLOTE||'' - ''||DESCRICAO AS DESCRICAO'+
            ' FROM CTRLINTERFACE '+
            ' WHERE FLGPREPARADO = 1 '+
            ' AND TIPO = ''B'' '+
            ' AND FLGVOLTATMP = 0 '+
            ' AND IDPESSOA = '+inttostr(iidfundacao)+' '+
            ' ORDER BY IDLOTE DESC';
    qryPreviaouEfetivada.Close;
    qryPreviaouEfetivada.SQL.Clear;
    qryPreviaouEfetivada.SQL.Add(sSql);
    qryPreviaouEfetivada.Open;
    dblkLoteouVersao.LookupField := '';
    dblkLoteouVersao.LookupField := 'IDLOTE';
    dblkLoteouVersao.Selected.add('DESCRICAO'+#9+'40'+#9+'Lote');
    dblkLoteouVersao.Refresh;
    sTabela := 'PREVIA';
  End
  Else
  Begin
    RdoTipoFiltro.Items.Strings[0] := 'Por Versão';
    LblLoteouVersao.Caption        := 'Versão';
    sSql := ' SELECT IDHSTFOLHABENEF, IDHSTFOLHABENEF||'' - ''||HISTORICO AS DESCRICAO '+
            ' FROM HSTFOLHABENEF '+
            ' WHERE '+
            ' IDFUNDACAO = '+inttostr(iidfundacao)+' '+
            ' ORDER BY IDHSTFOLHABENEF DESC ';
    qryPreviaouEfetivada.Close;
    qryPreviaouEfetivada.SQL.Clear;
    qryPreviaouEfetivada.SQL.Add(sSql);
    qryPreviaouEfetivada.Open;
    dblkLoteouVersao.LookupField := '';
    dblkLoteouVersao.LookupField := 'IDHSTFOLHABENEF';
    dblkLoteouVersao.Selected.add('DESCRICAO'+#9+'40'+#9+'Versão');
    dblkLoteouVersao.Refresh;
    sTabela := 'HISTRUBSAL';
  End;

  If RdoTipoFiltro.ItemIndex = 0 Then
  Begin
    CmbMes.ItemIndex             := -1;
    SpnedAno.Value               := 0;
    LblLoteouVersao.Enabled      := True;
    PnlPreviaouEfetivada.Enabled := True;
    PnlLoteouVersao.Enabled      := True;
    PnlMesPagto.Enabled          := False;
    LblMesPagto.Enabled          := False;
  End
  Else
  Begin
    dblkLoteouVersao.Text        := '';
    LblMesPagto.Enabled          := True;
    PnlPreviaouEfetivada.Enabled := True;
    PnlLoteouVersao.Enabled      := False;
    PnlMesPagto.Enabled          := True;
    LblLoteouVersao.Enabled      := False;
    CmbMes.ItemIndex             := wMes - 1;
    SpnedAno.Value               := wAno;
  End;
end;

end.
{------------------------------------------------------------------------------|
| UNIT: FREPORTS_FOLHA                                                         |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   FORM FILTRO PADRÃO BASE DE HERANÇA PARA FILTRO DE RELATÓRIOS.              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2003 A 10/07/2003                         |
| PENDÊNCIA: 14486                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO PARA MULTIFUNDAÇÃO.                                              |
|                                                                              |
|------------------------------------------------------------------------------}

