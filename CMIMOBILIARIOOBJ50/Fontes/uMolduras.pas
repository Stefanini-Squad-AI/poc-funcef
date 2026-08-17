unit uMolduras;

interface

uses
   StdCtrls;

   // atribui os valores default para a moldura responsável
   procedure AtribuiMolResponsavel(var iResponsavel: integer; var sResponsavel: TEdit);

   // atribui os valores default para a moldura usuário - sistema.idusuario = default
   procedure AtribuiMolUsuario(var iUsuario: integer; var sUsuario: TEdit);



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
      iResponsavel := Sistema.IdUsuario;       // NECESSÁRIO POIS O USUÁRIO PODE IR AO MOL E TROCAR O ID
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

   iUsuario       := Sistema.IdUsuario;       // NECESSÁRIO POIS O USUÁRIO PODE IR AO MOL E TROCAR O ID
   sUsuario.Text  := dtmLookImobiliario.qryLookUsuarioNOMEUSUARIO.AsString + ' - ' +
                     dtmLookImobiliario.qryLookUsuarioNOME.AsString;

   dtmLookImobiliario.qryLookUsuario.Close;
end;



end.
