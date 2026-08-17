{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit fCadRubXPensaoAlimenticia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, DBTables, Wwquery, DBCtrls, StdCtrls, wwdblook,
  Buttons, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls,
  MontaSelect, fcButton, fcImgBtn, fcShapeBtn, Grids, Wwdbigrd, Wwdbgrid;

type
  TFrmCadRubXPensaoAlimenticia = class(TfrmSairAjuda)
    qryRubricasDisponiveis: TwwQuery;
    qryRubricasAssociadas: TwwQuery;
    dsRubricasAssociadas: TwwDataSource;
    dsRubricasDisponiveis: TwwDataSource;
    qryAux: TwwQuery;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    DstLabel: TLabel;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    SrcLabel: TLabel;
    Panel3: TPanel;
    sbtnAssocia: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodas: TSpeedButton;
    sbtnAssociaTodas: TSpeedButton;
    procedure SetButtons;
    procedure FormShow(Sender: TObject);
    function InsertRubXPensaoAlimenticia(bInsereTudo: Boolean) : boolean;
    function DeleteRubXPensaoAlimenticia(bInsereTudo: Boolean) : boolean;
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnAssociaTodasClick(Sender: TObject);
    procedure sbtnDesassociaTodasClick(Sender: TObject);

  private
    { Private declarations }
    iIdEmpresa, iIdTitular, iIdPessoa, iIdFavorecido, iSeqRubrica : integer;
    procedure AbreQuery;
  public
    { Public declarations }
  end;

var
  FrmCadRubXPensaoAlimenticia: TFrmCadRubXPensaoAlimenticia;

implementation

uses dBaseDados, FCadRubricaIndiv;

{$R *.DFM}

procedure TFrmCadRubXPensaoAlimenticia.AbreQuery;
 var pidrubrica : longint;
begin
  qryRubricasAssociadas.close;
  qryRubricasAssociadas.ParamByName('pidempresa').asinteger:=
    frmCadRubricaIndiv.qryDet.fieldbyname('idempresa').asinteger;
  qryRubricasAssociadas.ParamByName('pidtitular').asinteger:=
    frmCadRubricaIndiv.qryDet.fieldbyname('idtitular').asinteger;
  qryRubricasAssociadas.ParamByName('pidpessoa').asinteger:=
    frmCadRubricaIndiv.qryDet.fieldbyname('idpessoa').asinteger;
  qryRubricasAssociadas.ParamByName('pidfavorecido').asinteger:=
    frmCadRubricaIndiv.qryDet.fieldbyname('idfavorecido').asinteger;
  qryRubricasAssociadas.ParamByName('pseqrubricaindiv').asinteger:=
    frmCadRubricaIndiv.qryDet.fieldbyname('seqrubricaindiv').asinteger;
  try
    qryRubricasAssociadas.open;
  except
  end;
  if qryRubricasDisponiveis.active then
    pidrubrica:=qryRubricasDisponiveis.fieldbyname('idprovento').asinteger
  else
    pidrubrica:=0;
  qryRubricasDisponiveis.close;
  qryRubricasDisponiveis.ParamByName('pidempresa').asinteger:=
    frmCadRubricaIndiv.qryDet.fieldbyname('idempresa').asinteger;
  qryRubricasDisponiveis.ParamByName('pidtitular').asinteger:=
    frmCadRubricaIndiv.qryDet.fieldbyname('idtitular').asinteger;
  qryRubricasDisponiveis.ParamByName('pidpessoa').asinteger:=
    frmCadRubricaIndiv.qryDet.fieldbyname('idpessoa').asinteger;
  qryRubricasDisponiveis.ParamByName('pidfavorecido').asinteger:=
    frmCadRubricaIndiv.qryDet.fieldbyname('idfavorecido').asinteger;
  qryRubricasDisponiveis.ParamByName('pseqrubricaindiv').asinteger:=
    frmCadRubricaIndiv.qryDet.fieldbyname('seqrubricaindiv').asinteger;
  try
    qryRubricasDisponiveis.open;
    if pidrubrica > 0 then
    begin
      qryRubricasDisponiveis.disablecontrols;
      while not qryRubricasDisponiveis.eof do
      begin
        if qryRubricasDisponiveis.fieldbyname('idprovento').asinteger >= pidrubrica then
          break;
        qryRubricasDisponiveis.next;
      end;
      qryRubricasDisponiveis.enablecontrols;
    end;
  except
  end;
end;

procedure TFrmCadRubXPensaoAlimenticia.FormShow(Sender: TObject);
begin
  inherited;
  qryRubricasAssociadas.prepare;
  qryRubricasDisponiveis.prepare;
  AbreQuery;
end;

procedure TFrmCadRubXPensaoAlimenticia.SetButtons;
begin
  sbtnAssocia.enabled:=not qryRubricasDisponiveis.isempty;
  sbtnDesassocia.enabled:=not qryRubricasAssociadas.isempty;
end;

function TFrmCadRubXPensaoAlimenticia.DeleteRubXPensaoAlimenticia(bInsereTudo: Boolean) : boolean;
 var ssql : string;
begin
  dtmBasedados.dbBaseDados.starttransaction;

  If bInsereTudo Then
  Begin
    ssql := 'DELETE FROM RUBXPENSAOALIM WHERE ';
    ssql := ssql + 'IDEMPRESA = '    + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('idempresa').asinteger)+' AND ';
    ssql := ssql + 'IDTITULAR = '    + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('idtitular').asinteger)+' AND ';
    ssql := ssql + 'IDPESSOA = '     + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('idpessoa').asinteger)+' AND ';
    ssql := ssql + 'IDFAVORECIDO = ' + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('idfavorecido').asinteger)+' AND ';
    ssql := ssql + 'SEQRUBRICAINDIV = ' + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('seqrubricaindiv').asinteger);
    qryAux.SQL.Clear;
    qryAux.SQL.Add(ssql);
    try
      qryAux.ExecSQL;
      dtmBaseDados.dbBaseDados.Commit;
    except
      dtmBaseDados.dbBaseDados.Rollback;
    end;
  End
  Else
  Begin
    ssql := 'DELETE FROM RUBXPENSAOALIM WHERE ';
    ssql := ssql + 'IDEMPRESA = '    + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('idempresa').asinteger)+' AND ';
    ssql := ssql + 'IDTITULAR = '    + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('idtitular').asinteger)+' AND ';
    ssql := ssql + 'IDPESSOA = '     + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('idpessoa').asinteger)+' AND ';
    ssql := ssql + 'IDFAVORECIDO = ' + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('idfavorecido').asinteger)+' AND ';
    ssql := ssql + 'IDRUBRICA = '    + IntToStr(qryRubricasAssociadas.fieldByName('IDPROVENTO').AsInteger)+' AND ';
    ssql := ssql + 'SEQRUBRICAINDIV = ' + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('seqrubricaindiv').asinteger);
    qryAux.SQL.Clear;
    qryAux.SQL.Add(ssql);
    try
      qryAux.ExecSQL;
      dtmBasedados.dbBaseDados.commit;
    except
      dtmBasedados.dbBaseDados.rollback;
    end;
  End;
end;

function TFrmCadRubXPensaoAlimenticia.InsertRubXPensaoAlimenticia(bInsereTudo: Boolean) : boolean;
 var ssql : string;
begin
  dtmBasedados.dbBaseDados.starttransaction;
  If bInsereTudo Then
  Begin
    qryRubricasDisponiveis.First;
    ssql := 'INSERT INTO RUBXPENSAOALIM (IDEMPRESA, IDTITULAR, IDPESSOA, '+
            'IDFAVORECIDO, SEQRUBRICAINDIV, IDRUBRICA) '+
            ' SELECT '+
            frmCadRubricaIndiv.qryDet.fieldbyname('idempresa').asstring+ ' AS IDEMPRESA, '+
            frmCadRubricaIndiv.qryDet.fieldbyname('idtitular').asstring+ ' AS IDTITULAR, '+
            frmCadRubricaIndiv.qryDet.fieldbyname('idpessoa').asstring+  ' AS IDPESSOA, '+
            frmCadRubricaIndiv.qryDet.fieldbyname('idfavorecido').asstring+ ' AS IDFAVORECIDO, '+
            frmCadRubricaIndiv.qryDet.fieldbyname('seqrubricaindiv').asstring+ ' AS SEQRUBRICA, '+
            '   P.IDPROVENTO '+

            ' FROM '+
            '   (select idprovento, descricao, nvl(codprovdesc,idprovento) codprovdesc '+
            '    from provdesc '+
            '    where flgdesconto in (0,1) '+
            '      and idprovento not in (select idrubrica '+
            '                             from rubxpensaoalim '+
            '                             where idempresa       = '+frmCadRubricaIndiv.qryDet.fieldbyname('idempresa').asstring+
            '                               and idtitular       = '+frmCadRubricaIndiv.qryDet.fieldbyname('idtitular').asstring+
            '                               and idpessoa        = '+frmCadRubricaIndiv.qryDet.fieldbyname('idpessoa').asstring+
            '                               and idfavorecido    = '+frmCadRubricaIndiv.qryDet.fieldbyname('idfavorecido').asstring+
            '                               and seqrubricaindiv = '+frmCadRubricaIndiv.qryDet.fieldbyname('seqrubricaindiv').asstring+') '+
            '    order by codprovdesc) P ';

    qryAux.SQL.Clear;
    qryAux.SQL.Add(ssql);
    try
      qryAux.ExecSQL;
      dtmBasedados.dbBaseDados.commit;
    except
      dtmBasedados.dbBaseDados.rollback;
    end;
    qryRubricasDisponiveis.Next;
  End
  Else
  Begin
    ssql := 'INSERT INTO RUBXPENSAOALIM (IDEMPRESA, IDTITULAR, IDPESSOA, '+
            'IDFAVORECIDO, IDRUBRICA, SEQRUBRICAINDIV) VALUES (';
    ssql := ssql + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('idempresa').asinteger)+', ';
    ssql := ssql + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('idtitular').asinteger)+', ';
    ssql := ssql + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('idpessoa').asinteger)+', ';
    ssql := ssql + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('idfavorecido').asinteger)+', ';
    ssql := ssql + IntToStr(qryRubricasDisponiveis.fieldByName('IDPROVENTO').AsInteger)+', ';
    ssql := ssql + IntToStr(frmCadRubricaIndiv.qryDet.fieldbyname('seqrubricaindiv').asinteger)+')';
    qryAux.SQL.Clear;
    qryAux.SQL.Add(ssql);
    try
      qryAux.ExecSQL;
      dtmBasedados.dbBaseDados.commit;
    except
      dtmBasedados.dbBaseDados.rollback;
    end;
  End;
end;

procedure TFrmCadRubXPensaoAlimenticia.sbtnAssociaClick(Sender: TObject);
begin
  inherited;
  InsertRubXPensaoAlimenticia(False);
  AbreQuery;
end;

procedure TFrmCadRubXPensaoAlimenticia.sbtnDesassociaClick(
  Sender: TObject);
begin
  inherited;
  DeleteRubXPensaoAlimenticia(False);
  AbreQuery;
end;

procedure TFrmCadRubXPensaoAlimenticia.sbtnAssociaTodasClick(Sender: TObject);
begin
  inherited;
  InsertRubXPensaoAlimenticia(True);
  AbreQuery;
end;

procedure TFrmCadRubXPensaoAlimenticia.sbtnDesassociaTodasClick(Sender: TObject);
begin
  inherited;
  DeleteRubXPensaoAlimenticia(True);
  AbreQuery;
end;

end.
