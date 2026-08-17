// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : SIG 121030
//Responsável : André Imakawa
//Data        : 25/11/2021
//Descrição   : Ajuste no campo CODPROVDESC das querys e criação da busca.
//--------------------------------------------------------------------------------
//Pendência   : SOL 193287 KINTANA 1843529
//Responsável : BRUNO AZEVEDO
//Data        : 05/11/2012
//Descrição   : Ajuste no controle de transação que estava gerando erro.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136934 KINTANA 873383
//Responsável : MARCIO DENILSON
//Data        : 25/01/2011
//Descrição   : Desenvolvimento inicial da tela
//--------------------------------------------------------------------------------
unit fCadRubXPensaoAlimenticiaRI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, DBTables, Wwquery, DBCtrls, StdCtrls, wwdblook,
  Buttons, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls,
  MontaSelect, fcButton, fcImgBtn, fcShapeBtn, Grids, Wwdbigrd, Wwdbgrid;

type
  TFrmCadRubXPensaoAlimenticiaRI = class(TfrmSairAjuda)
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
    btnProcurarRubricaDisponivel: TBitBtn;
    btnProcurarRubricaAssociada: TBitBtn;
    MontaBuscaRubrica: TMontaSelect;
    procedure SetButtons;
    procedure FormShow(Sender: TObject);
    function InsertRubXPensaoAlimenticia(bInsereTudo: Boolean) : boolean;
    function DeleteRubXPensaoAlimenticia(bInsereTudo: Boolean) : boolean;
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnAssociaTodasClick(Sender: TObject);
    procedure sbtnDesassociaTodasClick(Sender: TObject);
    procedure btnProcurarRubricaDisponivelClick(Sender: TObject);
    procedure btnProcurarRubricaAssociadaClick(Sender: TObject);

  private
    { Private declarations }
    iIdEmpresa, iIdTitular, iIdPessoa, iIdFavorecido, iSeqRubrica : integer;
    procedure AbreQuery;
  public
    { Public declarations }
  end;

var
  FrmCadRubXPensaoAlimenticiaRI: TFrmCadRubXPensaoAlimenticiaRI;

implementation

uses dBaseDados, FCadRubricaIndividualInserir;

{$R *.DFM}

procedure TFrmCadRubXPensaoAlimenticiaRI.AbreQuery;
 var pidrubrica : longint;
begin
  qryRubricasAssociadas.close;
  qryRubricasAssociadas.ParamByName('pidempresa').asinteger:=
    frmCadRubricaIndividualInserir.qryDet.fieldbyname('idempresa').asinteger;
  qryRubricasAssociadas.ParamByName('pidtitular').asinteger:=
    frmCadRubricaIndividualInserir.qryDet.fieldbyname('idtitular').asinteger;
  qryRubricasAssociadas.ParamByName('pidpessoa').asinteger:=
    frmCadRubricaIndividualInserir.qryDet.fieldbyname('idpessoa').asinteger;
  qryRubricasAssociadas.ParamByName('pidfavorecido').asinteger:=
    frmCadRubricaIndividualInserir.qryDet.fieldbyname('idfavorecido').asinteger;
  qryRubricasAssociadas.ParamByName('pseqrubricaindiv').asinteger:=
    frmCadRubricaIndividualInserir.qryDet.fieldbyname('seqrubricaindiv').asinteger;
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
    frmCadRubricaIndividualInserir.qryDet.fieldbyname('idempresa').asinteger;
  qryRubricasDisponiveis.ParamByName('pidtitular').asinteger:=
    frmCadRubricaIndividualInserir.qryDet.fieldbyname('idtitular').asinteger;
  qryRubricasDisponiveis.ParamByName('pidpessoa').asinteger:=
    frmCadRubricaIndividualInserir.qryDet.fieldbyname('idpessoa').asinteger;
  qryRubricasDisponiveis.ParamByName('pidfavorecido').asinteger:=
    frmCadRubricaIndividualInserir.qryDet.fieldbyname('idfavorecido').asinteger;
  qryRubricasDisponiveis.ParamByName('pseqrubricaindiv').asinteger:=
    frmCadRubricaIndividualInserir.qryDet.fieldbyname('seqrubricaindiv').asinteger;
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

procedure TFrmCadRubXPensaoAlimenticiaRI.FormShow(Sender: TObject);
begin
  inherited;
  qryRubricasAssociadas.prepare;
  qryRubricasDisponiveis.prepare;
  AbreQuery;
end;

procedure TFrmCadRubXPensaoAlimenticiaRI.SetButtons;
begin
  sbtnAssocia.enabled:=not qryRubricasDisponiveis.isempty;
  sbtnDesassocia.enabled:=not qryRubricasAssociadas.isempty;
end;

function TFrmCadRubXPensaoAlimenticiaRI.DeleteRubXPensaoAlimenticia(bInsereTudo: Boolean) : boolean;
 var ssql : string;
begin
  //BRUNO AZEVEDO SOL 193287 KINTANA 1843529
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBasedados.dbBaseDados.starttransaction;
  //BRUNO AZEVEDO SOL 193287 KINTANA 1843529

  If bInsereTudo Then
  Begin
    ssql := 'DELETE FROM RUBXPENSAOALIM WHERE ';
    ssql := ssql + 'IDEMPRESA = '    + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idempresa').asinteger)+' AND ';
    ssql := ssql + 'IDTITULAR = '    + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idtitular').asinteger)+' AND ';
    ssql := ssql + 'IDPESSOA = '     + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idpessoa').asinteger)+' AND ';
    ssql := ssql + 'IDFAVORECIDO = ' + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idfavorecido').asinteger)+' AND ';
    ssql := ssql + 'SEQRUBRICAINDIV = ' + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('seqrubricaindiv').asinteger);
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
    ssql := ssql + 'IDEMPRESA = '    + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idempresa').asinteger)+' AND ';
    ssql := ssql + 'IDTITULAR = '    + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idtitular').asinteger)+' AND ';
    ssql := ssql + 'IDPESSOA = '     + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idpessoa').asinteger)+' AND ';
    ssql := ssql + 'IDFAVORECIDO = ' + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idfavorecido').asinteger)+' AND ';
    ssql := ssql + 'IDRUBRICA = '    + IntToStr(qryRubricasAssociadas.fieldByName('IDPROVENTO').AsInteger)+' AND ';
    ssql := ssql + 'SEQRUBRICAINDIV = ' + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('seqrubricaindiv').asinteger);
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

function TFrmCadRubXPensaoAlimenticiaRI.InsertRubXPensaoAlimenticia(bInsereTudo: Boolean) : boolean;
 var ssql : string;
begin
  //BRUNO AZEVEDO SOL 193287 KINTANA 1843529
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBasedados.dbBaseDados.starttransaction;
  //BRUNO AZEVEDO SOL 193287 KINTANA 1843529
  
  If bInsereTudo Then
  Begin
    qryRubricasDisponiveis.First;
    ssql := 'INSERT INTO RUBXPENSAOALIM (IDEMPRESA, IDTITULAR, IDPESSOA, '+
            'IDFAVORECIDO, SEQRUBRICAINDIV, IDRUBRICA) '+
            ' SELECT '+
            frmCadRubricaIndividualInserir.qryDet.fieldbyname('idempresa').asstring+ ' AS IDEMPRESA, '+
            frmCadRubricaIndividualInserir.qryDet.fieldbyname('idtitular').asstring+ ' AS IDTITULAR, '+
            frmCadRubricaIndividualInserir.qryDet.fieldbyname('idpessoa').asstring+  ' AS IDPESSOA, '+
            frmCadRubricaIndividualInserir.qryDet.fieldbyname('idfavorecido').asstring+ ' AS IDFAVORECIDO, '+
            frmCadRubricaIndividualInserir.qryDet.fieldbyname('seqrubricaindiv').asstring+ ' AS SEQRUBRICA, '+
            '   P.IDPROVENTO '+

            ' FROM '+
            '   (select idprovento, descricao, nvl(codprovdesc,idprovento) codprovdesc '+
            '    from provdesc '+
            '    where flgdesconto in (0,1) '+
            '      and idprovento not in (select idrubrica '+
            '                             from rubxpensaoalim '+
            '                             where idempresa       = '+frmCadRubricaIndividualInserir.qryDet.fieldbyname('idempresa').asstring+
            '                               and idtitular       = '+frmCadRubricaIndividualInserir.qryDet.fieldbyname('idtitular').asstring+
            '                               and idpessoa        = '+frmCadRubricaIndividualInserir.qryDet.fieldbyname('idpessoa').asstring+
            '                               and idfavorecido    = '+frmCadRubricaIndividualInserir.qryDet.fieldbyname('idfavorecido').asstring+
            '                               and seqrubricaindiv = '+frmCadRubricaIndividualInserir.qryDet.fieldbyname('seqrubricaindiv').asstring+') '+
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
    ssql := ssql + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idempresa').asinteger)+', ';
    ssql := ssql + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idtitular').asinteger)+', ';
    ssql := ssql + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idpessoa').asinteger)+', ';
    ssql := ssql + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('idfavorecido').asinteger)+', ';
    ssql := ssql + IntToStr(qryRubricasDisponiveis.fieldByName('IDPROVENTO').AsInteger)+', ';
    ssql := ssql + IntToStr(frmCadRubricaIndividualInserir.qryDet.fieldbyname('seqrubricaindiv').asinteger)+')';
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

procedure TFrmCadRubXPensaoAlimenticiaRI.sbtnAssociaClick(Sender: TObject);
begin
  inherited;
  InsertRubXPensaoAlimenticia(False);
  AbreQuery;
end;

procedure TFrmCadRubXPensaoAlimenticiaRI.sbtnDesassociaClick(
  Sender: TObject);
begin
  inherited;
  DeleteRubXPensaoAlimenticia(False);
  AbreQuery;
end;

procedure TFrmCadRubXPensaoAlimenticiaRI.sbtnAssociaTodasClick(Sender: TObject);
begin
  inherited;
  InsertRubXPensaoAlimenticia(True);
  AbreQuery;
end;

procedure TFrmCadRubXPensaoAlimenticiaRI.sbtnDesassociaTodasClick(Sender: TObject);
begin
  inherited;
  DeleteRubXPensaoAlimenticia(True);
  AbreQuery;
end;

// Andre Imakawa - SIG 121030 - Inicio
procedure TFrmCadRubXPensaoAlimenticiaRI.btnProcurarRubricaDisponivelClick(
  Sender: TObject);
begin
  inherited;
  MontaBuscaRubrica.Executar;

  If ( qryRubricasDisponiveis.Active = True ) And ( MontaBuscaRubrica.RetornouValor ) Then
    if qryRubricasDisponiveis.Locate('IDPROVENTO', MontaBuscaRubrica.ValoresChave[0],[]) then
      wwDBGrid2.SetFocus;

end;

procedure TFrmCadRubXPensaoAlimenticiaRI.btnProcurarRubricaAssociadaClick(
  Sender: TObject);
begin
  inherited;
  MontaBuscaRubrica.Executar;

  If ( qryRubricasAssociadas.Active = True ) And ( MontaBuscaRubrica.RetornouValor ) Then
    if qryRubricasAssociadas.Locate('IDPROVENTO', MontaBuscaRubrica.ValoresChave[0],[]) then
      wwDBGrid1.SetFocus;
end;
// Andre Imakawa - SIG 121030 - Fim
end.
