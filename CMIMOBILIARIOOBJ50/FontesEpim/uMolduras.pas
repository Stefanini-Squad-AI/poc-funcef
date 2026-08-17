unit uMolduras;

interface

uses
   StdCtrls;

   // atribui os valores default para a moldura responsável
   procedure AtribuiMolResponsavel(var iResponsavel: integer; var sResponsavel: TEdit);

   // atribui os valores default para a moldura usuário - sistema.idusuario = default
   procedure AtribuiMolUsuario(var iUsuario: integer; var sUsuario: TEdit);

   // atribui os valores default para a moldura Localizacao (PARAMIMOVEL.IDLOCALIZACAO / PARAMIMOVEL.IDPESSOALOC )
   procedure AtribuiMolLocalizacao(const iLocalizacao, iPessoaLoc: integer; var sLocalizacao: TEdit; var iResponsavel: integer; var sCodCentroCusto: string);

   // atribui os valores default para a moldura Classe de Bem
   procedure AtribuiMolClasseBem(const iClasseBem: integer; var sClasseBem: TEdit);

   // atribui os valores default para a moldura Cliente
   procedure AtribuiMolCliente(const iCliente: integer; var sNomeFantasia, sRazaoSocial: TEdit);

   // atribui os valores default para a moldura Fornecedor
   procedure AtribuiMolFornecedor(const iFornecedor: integer; var sNomeFantasia, sRazaoSocial: TEdit);

implementation
uses
   dLookImobiliario, uSistema, uFuncoesImob;



// atribui os valores default para a moldura responsável
procedure AtribuiMolResponsavel(var iResponsavel: integer; var sResponsavel: TEdit);
begin
   LimpaParametros(dtmLookImobiliario.qryLookResponsavel);
   dtmLookImobiliario.qryLookResponsavel.ParamByName('PIDRESPONSAVEL').AsInteger := Sistema.IdUsuario;
   dtmLookImobiliario.qryLookResponsavel.Open;

   if dtmLookImobiliario.qryLookResponsavel.IsEmpty then begin  // travar o processamento com usuário inexistente
      iResponsavel := -999;
      sResponsavel.Text := '*** Não Localizado ***';
   end else begin
      iResponsavel := Sistema.IdUsuario;     
      sResponsavel.Text := dtmLookImobiliario.qryLookResponsavelNOME.AsString;
   end;

   dtmLookImobiliario.qryLookResponsavel.Close;
end;



// atribui os valores default para a moldura usuário (Sistema.idUsuario = Default)
procedure AtribuiMolUsuario(var iUsuario: integer; var sUsuario: TEdit);
begin
   LimpaParametros(dtmLookImobiliario.qryLookUsuario);
   dtmLookImobiliario.qryLookUsuario.ParamByName('PIDUSUARIO').AsInteger := Sistema.IdUsuario;
   dtmLookImobiliario.qryLookUsuario.Open;

   iUsuario       := Sistema.IdUsuario;      
   sUsuario.Text  := dtmLookImobiliario.qryLookUsuarioNOMEUSUARIO.AsString + ' - ' +
                     dtmLookImobiliario.qryLookUsuarioNOME.AsString;

   dtmLookImobiliario.qryLookUsuario.Close;
end;



// atribui os valores default para a moldura Localizacao (PARAMIMOVEL.IDLOCALIZACAO / PARAMIMOVEL.IDPESSOALOC )
procedure AtribuiMolLocalizacao(const iLocalizacao, iPessoaLoc: integer; var sLocalizacao: TEdit; var iResponsavel: integer; var sCodCentroCusto: string);
begin


   LimpaParametros(dtmLookImobiliario.qryLookLocalizacao);
   dtmLookImobiliario.qryLookLocalizacao.ParamByName('PIDLOCALIZACAO').AsInteger := iLocalizacao;
   dtmLookImobiliario.qryLookLocalizacao.ParamByName('PIDPESSOA').AsInteger := iPessoaLoc;
   dtmLookImobiliario.qryLookLocalizacao.Open;
   iResponsavel    := dtmLookImobiliario.qryLookLocalizacaoIDRESPONSAVEL.AsInteger;
   sCodCentroCusto := dtmLookImobiliario.qryLookLocalizacaoCODCENTROCUSTO.AsString;

   sLocalizacao.Text := dtmLookImobiliario.qryLookLocalizacaoNOME.AsString;

   dtmLookImobiliario.qryLookLocalizacao.Close;
end;



// atribui os valores default para a moldura Classe de Bem
procedure AtribuiMolClasseBem(const iClasseBem: integer; var sClasseBem: TEdit);
begin

   LimpaParametros(dtmLookImobiliario.qryLookClasseBem);
   dtmLookImobiliario.qryLookClasseBem.ParamByName('PIDCLASSEBEM').AsInteger := iClasseBem;
   dtmLookImobiliario.qryLookClasseBem.Open;

   sClasseBem.Text := dtmLookImobiliario.qryLookClasseBemDESCRICAO.AsString;

   dtmLookImobiliario.qryLookClasseBem.Close;
end;


// atribui os valores default para a moldura Cliente
procedure AtribuiMolCliente(const iCliente: integer; var sNomeFantasia, sRazaoSocial: TEdit);
begin

   LimpaParametros(dtmLookImobiliario.qryLookLocatario);
   dtmLookImobiliario.qryLookLocatario.ParamByName('PIDLOCATARIO').AsInteger := iCliente;
   dtmLookImobiliario.qryLookLocatario.Open;

   sNomeFantasia.Text := dtmLookImobiliario.qryLookLocatarioNOME.AsString;
   sRazaoSocial.Text  := dtmLookImobiliario.qryLookLocatarioRAZAOSOCIAL.AsString;

   dtmLookImobiliario.qryLookLocatario.Close;
end;


// atribui os valores default para a moldura Fornecedor
procedure AtribuiMolFornecedor(const iFornecedor: integer; var sNomeFantasia, sRazaoSocial: TEdit);
begin

   LimpaParametros(dtmLookImobiliario.qryLookFornecedor);
   dtmLookImobiliario.qryLookFornecedor.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   dtmLookImobiliario.qryLookFornecedor.ParamByName('PIDFORCLI').AsInteger := iFornecedor;
   dtmLookImobiliario.qryLookFornecedor.Open;

   sNomeFantasia.Text := dtmLookImobiliario.qryLookFornecedorNOME.AsString;
   sRazaoSocial.Text  := dtmLookImobiliario.qryLookFornecedorRAZAOSOCIAL.AsString;

   dtmLookImobiliario.qryLookFornecedor.Close;
end;

end.
